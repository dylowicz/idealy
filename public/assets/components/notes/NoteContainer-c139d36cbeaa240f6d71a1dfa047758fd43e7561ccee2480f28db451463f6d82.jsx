const React = require('react');
const Note = require('./Note.es6.jsx');

class NoteContainer extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            inEditMode: false,
            textAreaHeight: 0
        };

        this.onNoteEditDoubleClick = this.onNoteEditDoubleClick.bind(this);
        this.onNoteSaveClick = this.onNoteSaveClick.bind(this);
        this.onNoteCancelClick = this.onNoteCancelClick.bind(this);
    }

    onNoteEditDoubleClick(event) {
        const height = $(event.target).height() + 30;
        this.setState({
            inEditMode: true,
            textAreaHeight: height
        });
    }

    onNoteSaveClick(id, title, content) {
        this.props.onNoteEditSaveClick(id, title, content);
        this.setState({ inEditMode: false });
    }

    onNoteCancelClick() {
        this.setState({ inEditMode: false });
    }

    render() {
        return (
            <Note
                {...this.props.note}
                onNoteEditDoubleClick={this.onNoteEditDoubleClick}
                onNoteSaveClick={(title, content) => this.onNoteSaveClick(this.props.note.id, title, content)}
                onNoteCancelClick={this.onNoteCancelClick}
                onNoteDeleteClick={this.props.onNoteDeleteClick}
                inEditMode={this.state.inEditMode}
                textAreaHeight={this.state.textAreaHeight}
            />
        );
    }
}

module.exports = NoteContainer;
