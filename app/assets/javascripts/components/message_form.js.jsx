var MessageForm = React.createClass({




  handleButtonClick(){
     var component = this;
     var theText = this.refs.text.getDOMNode().value;

     var messageJSON = {
       message: {
         text: theText
       }
     }

     $.post("/api/chats/" + this.props.railsChatRoom.id + "/chats.json", messageJSON).then(function(json){
       component.refs.text.getDOMNode().value = "";


       window.location = window.location;
     });
   },

   render: function() {
     return <div className="message_form">
       <input type="text" ref="body"></input>
       <button onClick={this.handleButtonClick}>Submit</button>
     </div>
   }
 });
