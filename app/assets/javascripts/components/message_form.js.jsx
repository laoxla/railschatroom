var MessageForm = React.createClass({




  handleButtonClick(){
     var component = this;
     var theText = this.refs.text.getDOMNode().value;

     var messageJSON = {
       chat: {
         text: theText
       }
     }


     console.log(this.props)

     $.post("/api/railschatrooms/" + 1 + "/chats.json", messageJSON).then(function(json){
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
