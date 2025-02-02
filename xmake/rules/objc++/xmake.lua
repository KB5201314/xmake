--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015-2020, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        xmake.lua
--

-- define rule: objc.build
rule("objc.build")
    set_sourcekinds("mm")
    add_deps("c.build.pcheader")
    on_build_files("private.action.build.object", {batch = true})

-- define rule: objc++.build
rule("objc++.build")
    set_sourcekinds("mxx")
    add_deps("c++.build.pcheader")
    on_build_files("private.action.build.object", {batch = true})

-- define rule: objc
rule("objc++")
    add_deps("objc++.build", "objc.build", "utils.merge.object", "utils.merge.archive")
