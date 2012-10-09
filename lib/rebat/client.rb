class Rebat::Client
  attr_reader :relations

  def initialize(host, port, relations = {})
    @transport = Thrift::BufferedTransport.new(Thrift::Socket.new(host, port))
    @protocol = Thrift::BinaryProtocol.new(@transport)
    @client = Rebat::Thrift::RebatDB::Client.new(@protocol)
    @relations = relations

    @transport.open
  end

  def sendQuery(&block)
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

  def add(from_entity_id, from_entity_type, to_entity_id, to_entity_type, weight, relation_key)
    edge = Rebat::Thrift::Edge.new

    edge.fromEntityId   = from_entity_id
    edge.fromEntityType = from_entity_type
    edge.toEntityId     = to_entity_id
    edge.toEntityType   = to_entity_type
    edge.weight         = weight
    edge.relationId     = relations[relation_key]

    self.sendQuery do |client|
      client.addQuery(edge)
    end
  end

  def updateWeight(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_key, new_weight)
    edge = Rebat::Thrift::Edge.new

    edge.fromEntityId   = from_entity_id
    edge.fromEntityType = from_entity_type
    edge.toEntityId     = to_entity_id
    edge.toEntityType   = to_entity_type
    edge.relationId     = relations[relation_key]

    self.sendQuery do |client|
      client.updateWeightQuery(edge, new_weight)
    end
  end

  def delete(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_key)
    edge = Rebat::Thrift::Edge.new

    edge.fromEntityId   = from_entity_id
    edge.fromEntityType = from_entity_type
    edge.toEntityId     = to_entity_id
    edge.toEntityType   = to_entity_type
    edge.relationId     = relations[relation_key]

    self.sendQuery do |client|
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

  def truncate
    self.sendQuery do |client|
      client.truncate
    end
  end

  private
  attr_reader :transport, :protocol, :client
end
