const React = require('react');
const Note = require('./Note.es6.jsx');

class NoteContainer extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            inEditMode: false,
            inputHeight: 0
        };

        this.onNoteEditContentClick = this.onNoteEditContentClick.bind(this);
        this.onNoteSaveClick = this.onNoteSaveClick.bind(this);
        this.onNoteCancelClick = this.onNoteCancelClick.bind(this);
    }

    onNoteEditContentClick(event) {
        const height = $(event.target).height() + 30;
        this.setState({
            inEditMode: true,
            inputHeight: height
        });
    }

    onNoteSaveClick(id, content) {
        this.props.onNoteEditSaveClick(id, content);
        this.setState({ inEditMode: false });
    }

    onNoteCancelClick() {
        this.setState({ inEditMode: false });
    }

    render() {
        return (
            <Note
                {...this.props.note}
                onNoteEditContentClick={this.onNoteEditContentClick}
                onNoteSaveClick={content => this.onNoteSaveClick(this.props.note.id, content)}
                onNoteCancelClick={this.onNoteCancelClick}
                onNoteDeleteClick={this.props.onNoteDeleteClick}
                inEditMode={this.state.inEditMode}
                inputHeight={this.state.inputHeight}
            />
        );
    }
}

module.exports = NoteContainer;
