class Rebat::Client
  def initialize(host, port, relations)
    @transport = Thrift::BufferedTransport.new(Thrift::Socket.new(host, port))
    @protocol = Thrift::BinaryProtocol.new(@transport)
    @client = Rebat::Thrift::RebatDB::Client.new(@protocol)

    @transport.open
  end

  def send(&block)
    begin
      @transport.open unless @transport.open?
      yield @client
    rescue Thrift::Exception => tx
      print 'Thrift::Exception: ', tx.message, "\n"
    end
  end

  def close
    @transport.close
  end

  def add(from_entity_id, from_entity_type, to_entity_id, to_entity_type, weight, relation_id)
    edge = Rebat::Thrift::Edge.new

    edge.fromEntityId   = from_entity_id
    edge.fromEntityType = from_entity_type
    edge.toEntityId     = to_entity_id
    edge.toEntityType   = to_entity_type
    edge.weight         = weight
    edge.relationId     = relation_id

    self.send do |client|
      client.addQuery(edge)
    end
  end

  def updateWeight(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_id, new_weight)
    edge = Rebat::Thrift::Edge.new

    edge.fromEntityId   = from_entity_id
    edge.fromEntityType = from_entity_type
    edge.toEntityId     = to_entity_id
    edge.toEntityType   = to_entity_type
    edge.relationId     = relation_id

    self.send do |client|
      client.updateWeightQuery(edge, new_weight)
    end
  end

  def delete(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_id)
    edge = Rebat::Thrift::Edge.new

    edge.fromEntityId   = from_entity_id
    edge.fromEntityType = from_entity_type
    edge.toEntityId     = to_entity_id
    edge.toEntityType   = to_entity_type
    edge.relationId     = relation_id

    self.send do |client|
      client.deleteQuery(edge)
    end
  end

  def where(*args)
    Rebat::Selector.new(self).where *args
  end

  def union(*args)
    Rebat::Selector.new(self).union *args
  end

  def intersect(*args)
    Rebat::Selector.new(self).intersect *args
  end

  def exclude(*args)
    Rebat::Selector.new(self).exclude *args
  end
end
