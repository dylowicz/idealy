const React = require('react');
const $ = require('jquery');

class NotesBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = { notes: this.props.notes };

        this.onNoteNewSubmit = this.onNoteNewSubmit.bind(this);
        this.onNoteEditSaveClick = this.onNoteEditSaveClick.bind(this);
        this.onNoteDeleteClick = this.onNoteDeleteClick.bind(this);
        this._getNotes = this._getNotes.bind(this);
        this._createNote = this._createNote.bind(this);
        this._updateNote = this._updateNote.bind(this);
        this._deleteNote = this._deleteNote.bind(this);
    }

    componentDidMount() {
        this._getNotes();
    }

    onNoteNewSubmit(event, content) {
        event.preventDefault();
        $('#add-note-content-textarea').val('');
        if (content.trim() === "") return;
        const newNote = {
            content: content.trim()
        };
        this._createNote(this.props.url, {note: newNote});
    }

    onNoteEditSaveClick(id, content) {
        if (content.trim() === "") return;
        const editedNote = {
            id: id,
            content: content
        };
        this._updateNote(`${this.props.url}/${id}`, {note: editedNote});
    }

    onNoteDeleteClick(id) {
        this._deleteNote(`${this.props.url}/${id}`);
    }

    _getNotes() {
        $.ajax({
            url: this.props.url,
            method: 'GET',
            dataType: 'json',
            cache: false,
            success: (notes) => {
                this.setState({notes: notes});
            },
            error: (xhr, status, err) => {
                this.setState({notes: this.state.notes});
                console.error(url, status, err.toString());
            }
        });
    }

    _createNote(url, data) {
        $.ajax({
            url: url,
            method: 'POST',
            dataType: 'json',
            data: data,
            success: () => this._getNotes(),
            error: (xhr, status, err) => {
                this.setState({notes: this.state.notes});
                console.error(url, status, err.toString());
            }
        });
    }

    _updateNote(url, data) {
        $.ajax({
            url: url,
            method: 'PATCH',
            dataType: 'json',
            data: data,
            success: () => this._getNotes(),
            error: (xhr, status, err) => {
                this.setState({notes: this.state.notes});
                console.error(url, status, err.toString());
            }
        });
    }

    _deleteNote(url) {
        $.ajax({
            url: url,
            method: 'DELETE',
            success: () => this._getNotes(),
            error: (xhr, status, err) => {
                this.setState({notes: this.state.notes});
                console.error(url, status, err.toString());
            }
        });
    }

    render() {
        return (
            <div className="container-fluid" id="notes-box">
                <h3 className="text-center" id="notes-header">Thoughts</h3>
                <div className="well">
                    { this.state.notes.length === 0 ?
                        <p className="text-muted text-center" id="no-notes-info">Nothing has been said, yet!</p> :
                        <NoteList
                            notes={this.state.notes}
                            onNoteEditSaveClick={this.onNoteEditSaveClick}
                            onNoteDeleteClick={this.onNoteDeleteClick}
                        />
                    }
                    <NoteForm onNoteSubmit={this.onNoteNewSubmit}/>
                </div>
            </div>
        );
    }
}

module.exports = NotesBox;
