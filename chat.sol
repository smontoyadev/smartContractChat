//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Chat {

    struct Message {
        uint id;
        address from;
        string message;
    }

    event sendMessageEvent(uint _id, address _from, string _message);

    uint lastMessageId;
    uint messageIdCounter;

    mapping(uint => Message) private messagesList;

    function sendMessage(string memory _text) public {

         lastMessageId++;

         // msg.sender es la persona que está actualmente conectada al contrato 

         emit sendMessageEvent(lastMessageId, msg.sender, _text);

         messagesList[lastMessageId++] = Message(
             lastMessageId, msg.sender, _text
         );
  }

    // Usando lo visto en clase acerca de los mapping, voy a mapear un array de mensajes por id, para tener el historial de mensajes
   
    uint messages;
    uint numOfMessages;

    function listMessages() public view returns (uint[] memory){
    
    // Validador por si el chat está vacío
    if(lastMessageId == 0) {
      return new uint[](0);
    }
    
    // ids de los mensajes
    uint[] memory ids = new uint[](lastMessageId);
    
    for (uint i = 1; i <= lastMessageId; i++) {
       ids[numOfMessages] = messagesList[i].id;
    }
    return ids;
  }
}
    
    





