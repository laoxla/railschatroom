var MessageForm = React.createClass({




  handleButtonClick(){
     var component = this;
     var theText = this.refs.text.getDOMNode().value;

     var messageJSON = {
   //.require(...
       chat: {
      //.permit(...
         text: theText
       }
     }


     console.log(this.props)

     $.post("/api/chats/" + this.props.room.id + "/chats.json", messageJSON).then(function(json_msg){
       component.refs.text.getDOMNode().value = "";


       window.location = window.location;
     });
   },

   render: function() {
     return <div className="message_form">
       <input type="text" ref="text"></input>
       <button onClick={this.handleButtonClick}>Submit</button>
     </div>
   }
 });
