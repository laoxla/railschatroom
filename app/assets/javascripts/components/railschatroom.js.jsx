var Railschatroom = React.createClass({


  getInitialState(){
     return{
       railsChatRooms: this.props.rooms,
       currentMessages: [],
       currentRoom: this.props.rooms[0]
     }

    },


  componentDidMount(){
      var component = this;
      fetch("/api/chats").then(function(response){
        response.json().then(function(json_data){
          // console.log(json_data)

          component.props.chat_data = json_data
          //1) map new array of messages  from json_data-array
          var messageList = json_data.msgs.map(function(msgObject){
            return msgObject
          })


          //2) setState with array of messages
          component.setState({
            currentMessages:  messageList//<--an array of messages
          })
        });
      });
    },

  _changeRoom(evt){
    console.log(evt)
    console.log(evt.target)
    var clickedRoomId = parseInt(evt.target.getAttribute('data-room'))

    var newRoom = this.state.railsChatRooms.find(function(roomObject){
      return roomObject.id === clickedRoomId
    })

    this.setState({
      currentRoom: newRoom
    })
  },

  render() {
    var component = this

    // console.log(this.props.users)
    // console.log(this.props.rooms)

    //### Handle Click - Changing Rooms ### //
    var chatroom_buttons = this.state.railsChatRooms.map(function(railsChatRoom){
      return <button onClick= {component._changeRoom} data-room={railsChatRoom.id}>{railsChatRoom.name}</button>
    })

    var filteredMessagesByRoom = this.state.currentMessages.filter(function(message){

       return message.railschatroom_id === component.state.currentRoom.id
    })

     var messageTags = filteredMessagesByRoom.map(function(message){
       return <p>{message.text}</p>
     })

      return (

        <div>
          <h3>Channels</h3>
             {chatroom_buttons}


          <h2>{this.state.currentRoom.name}</h2>

          <h4>Messages</h4>
          {messageTags}

        </div>
      )
    }


});
