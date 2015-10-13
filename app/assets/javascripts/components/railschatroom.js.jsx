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
      fetch("/api/chats", {credentials: 'include'}).then(function(response){
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

  _createRoom(){
     var theName = this.refs.newRoomName.getDOMNode().value
    var postParams = {
  //.require(...
      railschatroom: {
    //.permit(...
        name: theName
      }
    }
       var component = this
    $.post("/api/railschatrooms", postParams).done(function(new_room_obj){
        var existingRooms = component.state.railsChatRooms.map(function(room_obj){
          return room_obj
        })
        existingRooms.push(new_room_obj)
        component.setState({
          railsChatRooms: existingRooms
        })
    })
  },

  render() {
    var component = this

    // console.log(this.props.users)
    // console.log(this.props.rooms)

    //### Handle Click - Changing Rooms ### //
    var chatroom_buttons = this.state.railsChatRooms.map(function(railsChatRoom){
      return(
        <div className="rooms">
          <button className ="rooms" onClick={component._changeRoom} data-room={railsChatRoom.id}>{railsChatRoom.name}</button>
        </div>
    )
    })

    var filteredMessagesByRoom = this.state.currentMessages.filter(function(message){

       return message.railschatroom_id === component.state.currentRoom.id
    })

     var messageTags = filteredMessagesByRoom.map(function(message){
       return(
         <div>
         <hr></hr>

         <div className="chats">
         <h4>{message.text}</h4>
         <cite>{message.user.handle} - {message.posted_at}</cite>
        </div>
        </div>
       )

     })

      return (

        <div>
          <div className="container">
            <div className="channel">
              <h2>Channels</h2>
                 {chatroom_buttons}
                 <hr/>
                 <input type="text" ref="newRoomName"></input>
                 <button onClick={this._createRoom}>+ New Room</button>

            </div>
              <div className="chatbox">
               <h2>{this.state.currentRoom.name}</h2>
                   {messageTags}
                   <div><br></br> </div>
                  <div className="addText">
                   <MessageForm room={this.state.currentRoom}></MessageForm>
                   </div>
              </div>
             </div>
           </div>
      )
    }


});
