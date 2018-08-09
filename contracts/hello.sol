/*
  Copyright (c) 2018-present evan GmbH.
 
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
 
      http://www.apache.org/licenses/LICENSE-2.0
 
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

/*
  Copyright (c) 2018-present evan GmbH.
 
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
 
      http://www.apache.org/licenses/LICENSE-2.0
 
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  
*/

/*
 * Copyright 2018 Contractus GmbH
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

pragma solidity ^0.4.20;

contract HelloWorld {
  // all data and code is visible to everyone, that's the point of the blockchain
  // the accessability indicators only affect writing changes and access syntax
  address public creator;
  string prompt;

  constructor() public {
    creator = tx.origin;
  }
  
  function setPrompt(string value) external {
    // the most basic form of access control
    // it just silently ignores any invalid access
    // proper exceptions would be better
    if (msg.sender == address(creator)) prompt = value;
  }

  // anything that is done in the blockchain costs gas (i.e. currency)
  // this function concatenates strings, which can be rather expensive
  // so whenever possible such utility functionality should be done outside the chain
  // the view modifier indicates that state is read, but not changed
  function hello(string salut) external view returns (bytes) {
    bytes memory tmp0 = bytes(prompt);
    bytes memory tmp1 = bytes(salut);
    string memory greeting =  new string(tmp0.length + tmp1.length);
    bytes memory buffer = bytes(greeting);
    uint k = 0;
    for(uint i = 0; i < tmp0.length;) buffer[k++] = tmp0[i++];
    for(i = 0; i < tmp1.length;) buffer[k++] = tmp1[i++];
    return buffer;
  }
}
