#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'rebat_types'

        module Rebat
          module Thrift
            module RebatDB
              class Client
                include ::Thrift::Client

                def addQuery(edge)
                  send_addQuery(edge)
                  return recv_addQuery()
                end

                def send_addQuery(edge)
                  send_message('addQuery', AddQuery_args, :edge => edge)
                end

                def recv_addQuery()
                  result = receive_message(AddQuery_result)
                  return result.success unless result.success.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'addQuery failed: unknown result')
                end

                def deleteQuery(edge)
                  send_deleteQuery(edge)
                  return recv_deleteQuery()
                end

                def send_deleteQuery(edge)
                  send_message('deleteQuery', DeleteQuery_args, :edge => edge)
                end

                def recv_deleteQuery()
                  result = receive_message(DeleteQuery_result)
                  return result.success unless result.success.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'deleteQuery failed: unknown result')
                end

                def updateWeightQuery(edge, weight)
                  send_updateWeightQuery(edge, weight)
                  return recv_updateWeightQuery()
                end

                def send_updateWeightQuery(edge, weight)
                  send_message('updateWeightQuery', UpdateWeightQuery_args, :edge => edge, :weight => weight)
                end

                def recv_updateWeightQuery()
                  result = receive_message(UpdateWeightQuery_result)
                  return result.success unless result.success.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'updateWeightQuery failed: unknown result')
                end

                def selectQuery(queryList)
                  send_selectQuery(queryList)
                  return recv_selectQuery()
                end

                def send_selectQuery(queryList)
                  send_message('selectQuery', SelectQuery_args, :queryList => queryList)
                end

                def recv_selectQuery()
                  result = receive_message(SelectQuery_result)
                  return result.success unless result.success.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'selectQuery failed: unknown result')
                end

                def truncate()
                  send_truncate()
                  return recv_truncate()
                end

                def send_truncate()
                  send_message('truncate', Truncate_args)
                end

                def recv_truncate()
                  result = receive_message(Truncate_result)
                  return result.success unless result.success.nil?
                  raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'truncate failed: unknown result')
                end

              end

              class Processor
                include ::Thrift::Processor

                def process_addQuery(seqid, iprot, oprot)
                  args = read_args(iprot, AddQuery_args)
                  result = AddQuery_result.new()
                  result.success = @handler.addQuery(args.edge)
                  write_result(result, oprot, 'addQuery', seqid)
                end

                def process_deleteQuery(seqid, iprot, oprot)
                  args = read_args(iprot, DeleteQuery_args)
                  result = DeleteQuery_result.new()
                  result.success = @handler.deleteQuery(args.edge)
                  write_result(result, oprot, 'deleteQuery', seqid)
                end

                def process_updateWeightQuery(seqid, iprot, oprot)
                  args = read_args(iprot, UpdateWeightQuery_args)
                  result = UpdateWeightQuery_result.new()
                  result.success = @handler.updateWeightQuery(args.edge, args.weight)
                  write_result(result, oprot, 'updateWeightQuery', seqid)
                end

                def process_selectQuery(seqid, iprot, oprot)
                  args = read_args(iprot, SelectQuery_args)
                  result = SelectQuery_result.new()
                  result.success = @handler.selectQuery(args.queryList)
                  write_result(result, oprot, 'selectQuery', seqid)
                end

                def process_truncate(seqid, iprot, oprot)
                  args = read_args(iprot, Truncate_args)
                  result = Truncate_result.new()
                  result.success = @handler.truncate()
                  write_result(result, oprot, 'truncate', seqid)
                end

              end

              # HELPER FUNCTIONS AND STRUCTURES

              class AddQuery_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                EDGE = 1

                FIELDS = {
                  EDGE => {:type => ::Thrift::Types::STRUCT, :name => 'edge', :class => Rebat::Thrift::Edge}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class AddQuery_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class DeleteQuery_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                EDGE = 1

                FIELDS = {
                  EDGE => {:type => ::Thrift::Types::STRUCT, :name => 'edge', :class => Rebat::Thrift::Edge}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class DeleteQuery_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class UpdateWeightQuery_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                EDGE = 1
                WEIGHT = 2

                FIELDS = {
                  EDGE => {:type => ::Thrift::Types::STRUCT, :name => 'edge', :class => Rebat::Thrift::Edge},
                  WEIGHT => {:type => ::Thrift::Types::I64, :name => 'weight'}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class UpdateWeightQuery_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class SelectQuery_args
                include ::Thrift::Struct, ::Thrift::Struct_Union
                QUERYLIST = 1

                FIELDS = {
                  QUERYLIST => {:type => ::Thrift::Types::LIST, :name => 'queryList', :element => {:type => ::Thrift::Types::STRUCT, :class => Rebat::Thrift::Query}}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class SelectQuery_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => Rebat::Thrift::Edge}}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Truncate_args
                include ::Thrift::Struct, ::Thrift::Struct_Union

                FIELDS = {

                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

              class Truncate_result
                include ::Thrift::Struct, ::Thrift::Struct_Union
                SUCCESS = 0

                FIELDS = {
                  SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'}
                }

                def struct_fields; FIELDS; end

                def validate
                end

                ::Thrift::Struct.generate_accessors self
              end

            end

          end
        end
