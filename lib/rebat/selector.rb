class Rebat::Selector
  attr_reader :client

  def initialize(client)
    @client = client
    @query_list = []
  end

  def where(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_key)
    @query_list << create_query(from_entity_id, from_entity_type, to_entity_id, to_entity_type, @client.relations[relation_key], Rebat::Thrift::QueryType::WHERE)
    return self
  end

  def union(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_key)
    @query_list << create_query(from_entity_id, from_entity_type, to_entity_id, to_entity_type, @client.relations[relation_key], Rebat::Thrift::QueryType::UNION)
    return self
  end

  def intersect(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_key)
    @query_list << create_query(from_entity_id, from_entity_type, to_entity_id, to_entity_type, @client.relations[relation_key], Rebat::Thrift::QueryType::INTERSECT)
    return self
  end

  def exclude(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_key)
    @query_list << create_query(from_entity_id, from_entity_type, to_entity_id, to_entity_type, @client.relations[relation_key], Rebat::Thrift::QueryType::EXCLUDE)
    return self
  end

  def entries
    @client.send do |client|
      return client.selectQuery(@query_list)
    end
  end

  private
  attr_reader :query_list

  def create_query(from_entity_id, from_entity_type, to_entity_id, to_entity_type, relation_id, qtype)
    edge = Rebat::Thrift::Edge.new

    edge.fromEntityId   = from_entity_id    unless from_entity_id.nil?
    edge.fromEntityType = from_entity_type  unless from_entity_type.nil?
    edge.toEntityId     = to_entity_id      unless to_entity_id.nil?
    edge.toEntityType   = to_entity_type    unless to_entity_type.nil?
    edge.relationId     = relation_id

    query = Rebat::Thrift::Query.new

    query.edge = edge
    query.qtype = qtype

    return query
  end
end