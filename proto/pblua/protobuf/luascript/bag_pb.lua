-- Generated By protoc-gen-lua Do not Edit
local protobuf = require "protobuf"
local common_pb = require("common_pb")
module('bag_pb')


local REQWEAR = protobuf.Descriptor();
local REQWEAR_ITEMID_FIELD = protobuf.FieldDescriptor();
local REQWEAR_ATTRTYPE_FIELD = protobuf.FieldDescriptor();
local REQWEAR_ATTRVALUE_FIELD = protobuf.FieldDescriptor();
local REQWEAR_ID_FIELD = protobuf.FieldDescriptor();
local REQWEAR_EQUIPTYPE_FIELD = protobuf.FieldDescriptor();
local RSPWEAR = protobuf.Descriptor();
local RSPWEAR_ITEMID_FIELD = protobuf.FieldDescriptor();
local RSPWEAR_ATK_FIELD = protobuf.FieldDescriptor();
local RSPWEAR_DEF_FIELD = protobuf.FieldDescriptor();

REQWEAR_ITEMID_FIELD.name = "itemId"
REQWEAR_ITEMID_FIELD.full_name = ".ReqWear.itemId"
REQWEAR_ITEMID_FIELD.number = 1
REQWEAR_ITEMID_FIELD.index = 0
REQWEAR_ITEMID_FIELD.label = 2
REQWEAR_ITEMID_FIELD.has_default_value = false
REQWEAR_ITEMID_FIELD.default_value = 0
REQWEAR_ITEMID_FIELD.type = 5
REQWEAR_ITEMID_FIELD.cpp_type = 1

REQWEAR_ATTRTYPE_FIELD.name = "attrType"
REQWEAR_ATTRTYPE_FIELD.full_name = ".ReqWear.attrType"
REQWEAR_ATTRTYPE_FIELD.number = 2
REQWEAR_ATTRTYPE_FIELD.index = 1
REQWEAR_ATTRTYPE_FIELD.label = 2
REQWEAR_ATTRTYPE_FIELD.has_default_value = false
REQWEAR_ATTRTYPE_FIELD.default_value = 0
REQWEAR_ATTRTYPE_FIELD.type = 5
REQWEAR_ATTRTYPE_FIELD.cpp_type = 1

REQWEAR_ATTRVALUE_FIELD.name = "attrValue"
REQWEAR_ATTRVALUE_FIELD.full_name = ".ReqWear.attrValue"
REQWEAR_ATTRVALUE_FIELD.number = 3
REQWEAR_ATTRVALUE_FIELD.index = 2
REQWEAR_ATTRVALUE_FIELD.label = 2
REQWEAR_ATTRVALUE_FIELD.has_default_value = false
REQWEAR_ATTRVALUE_FIELD.default_value = 0
REQWEAR_ATTRVALUE_FIELD.type = 5
REQWEAR_ATTRVALUE_FIELD.cpp_type = 1

REQWEAR_ID_FIELD.name = "id"
REQWEAR_ID_FIELD.full_name = ".ReqWear.id"
REQWEAR_ID_FIELD.number = 4
REQWEAR_ID_FIELD.index = 3
REQWEAR_ID_FIELD.label = 2
REQWEAR_ID_FIELD.has_default_value = false
REQWEAR_ID_FIELD.default_value = 0
REQWEAR_ID_FIELD.type = 5
REQWEAR_ID_FIELD.cpp_type = 1

REQWEAR_EQUIPTYPE_FIELD.name = "equipType"
REQWEAR_EQUIPTYPE_FIELD.full_name = ".ReqWear.equipType"
REQWEAR_EQUIPTYPE_FIELD.number = 5
REQWEAR_EQUIPTYPE_FIELD.index = 4
REQWEAR_EQUIPTYPE_FIELD.label = 2
REQWEAR_EQUIPTYPE_FIELD.has_default_value = false
REQWEAR_EQUIPTYPE_FIELD.default_value = 0
REQWEAR_EQUIPTYPE_FIELD.type = 5
REQWEAR_EQUIPTYPE_FIELD.cpp_type = 1

REQWEAR.name = "ReqWear"
REQWEAR.full_name = ".ReqWear"
REQWEAR.nested_types = {}
REQWEAR.enum_types = {}
REQWEAR.fields = {REQWEAR_ITEMID_FIELD, REQWEAR_ATTRTYPE_FIELD, REQWEAR_ATTRVALUE_FIELD, REQWEAR_ID_FIELD, REQWEAR_EQUIPTYPE_FIELD}
REQWEAR.is_extendable = false
REQWEAR.extensions = {}
RSPWEAR_ITEMID_FIELD.name = "itemId"
RSPWEAR_ITEMID_FIELD.full_name = ".RspWear.itemId"
RSPWEAR_ITEMID_FIELD.number = 1
RSPWEAR_ITEMID_FIELD.index = 0
RSPWEAR_ITEMID_FIELD.label = 2
RSPWEAR_ITEMID_FIELD.has_default_value = false
RSPWEAR_ITEMID_FIELD.default_value = 0
RSPWEAR_ITEMID_FIELD.type = 5
RSPWEAR_ITEMID_FIELD.cpp_type = 1

RSPWEAR_ATK_FIELD.name = "atk"
RSPWEAR_ATK_FIELD.full_name = ".RspWear.atk"
RSPWEAR_ATK_FIELD.number = 2
RSPWEAR_ATK_FIELD.index = 1
RSPWEAR_ATK_FIELD.label = 2
RSPWEAR_ATK_FIELD.has_default_value = false
RSPWEAR_ATK_FIELD.default_value = 0
RSPWEAR_ATK_FIELD.type = 5
RSPWEAR_ATK_FIELD.cpp_type = 1

RSPWEAR_DEF_FIELD.name = "def"
RSPWEAR_DEF_FIELD.full_name = ".RspWear.def"
RSPWEAR_DEF_FIELD.number = 3
RSPWEAR_DEF_FIELD.index = 2
RSPWEAR_DEF_FIELD.label = 2
RSPWEAR_DEF_FIELD.has_default_value = false
RSPWEAR_DEF_FIELD.default_value = 0
RSPWEAR_DEF_FIELD.type = 5
RSPWEAR_DEF_FIELD.cpp_type = 1

RSPWEAR.name = "RspWear"
RSPWEAR.full_name = ".RspWear"
RSPWEAR.nested_types = {}
RSPWEAR.enum_types = {}
RSPWEAR.fields = {RSPWEAR_ITEMID_FIELD, RSPWEAR_ATK_FIELD, RSPWEAR_DEF_FIELD}
RSPWEAR.is_extendable = false
RSPWEAR.extensions = {}

ReqWear = protobuf.Message(REQWEAR)
RspWear = protobuf.Message(RSPWEAR)

