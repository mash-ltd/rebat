#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#


module Rebat
  module Thrift
        module QueryType
          WHERE = 0
          INTERSECT = 1
          UNION = 2
          NOT = 3
          VALUE_MAP = {0 => "WHERE", 1 => "INTERSECT", 2 => "UNION", 3 => "NOT"}
          VALID_VALUES = Set.new([WHERE, INTERSECT, UNION, NOT]).freeze
        end

        class Edge
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FROMENTITYID = 1
          FROMENTITYTYPE = 2
          TOENTITYID = 3
          TOENTITYTYPE = 4
          WEIGHT = 5
          RELATIONID = 6

          FIELDS = {
            FROMENTITYID => {:type => ::Thrift::Types::I64, :name => 'fromEntityId', :optional => true},
            FROMENTITYTYPE => {:type => ::Thrift::Types::STRING, :name => 'fromEntityType', :optional => true},
            TOENTITYID => {:type => ::Thrift::Types::I64, :name => 'toEntityId', :optional => true},
            TOENTITYTYPE => {:type => ::Thrift::Types::STRING, :name => 'toEntityType', :optional => true},
            WEIGHT => {:type => ::Thrift::Types::I64, :name => 'weight', :default => 0, :optional => true},
            RELATIONID => {:type => ::Thrift::Types::I64, :name => 'relationId', :optional => true}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Query
          include ::Thrift::Struct, ::Thrift::Struct_Union
          EDGE = 1
          QTYPE = 2

          FIELDS = {
            EDGE => {:type => ::Thrift::Types::STRUCT, :name => 'edge', :class => Rebat::Thrift::Edge},
            QTYPE => {:type => ::Thrift::Types::I32, :name => 'qtype', :default =>             0, :optional => true, :enum_class => Rebat::Thrift::QueryType}
          }

          def struct_fields; FIELDS; end

          def validate
            raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field edge is unset!') unless @edge
            unless @qtype.nil? || Rebat::Thrift::QueryType::VALID_VALUES.include?(@qtype)
              raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field qtype!')
            end
          end

          ::Thrift::Struct.generate_accessors self
        end

      end
    end