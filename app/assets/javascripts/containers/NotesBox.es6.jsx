class NotesBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = {notes: this.props.notes};

        this.onNoteSubmit = this.onNoteSubmit.bind(this);
        this.onNoteDeleteClick = this.onNoteDeleteClick.bind(this);
        this._getNotes = this._getNotes.bind(this);
        this._createNote = this._createNote.bind(this);
        this._updateNote = this._updateNote.bind(this);
        this._deleteNote = this._deleteNote.bind(this);
    }

    componentDidMount() {
        this._getNotes();
    }

    onNoteSubmit(event, content) {
        event.preventDefault();
        $('#add-note').val('');
        if (content.trim() === "") return;
        const newNote = {
            content: content.trim()
        };

        this._createNote(this.props.url, {note: newNote});
    }

    onNoteDeleteClick(id) {
        this._deleteNote(this.props.url + '/' + id);
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
            error: (xhr, status, err) =>  {
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
            error: (xhr, status, err) =>  {
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
            error: (xhr, status, err) =>  {
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
            error: (xhr, status, err) =>  {
                this.setState({notes: this.state.notes});
                console.error(url, status, err.toString());
            }
        });
    }

    render() {
        return (
            <div className="notes-box container-fluid">
                <h3 className="text-center">Thoughts</h3>
                <div className="well">
                    { this.state.notes.length === 0 ?
                        <p className="text-muted text-center">Nothing has been said, yet!</p> :
                        <NoteList notes={this.state.notes} onNoteDeleteClick={this.onNoteDeleteClick}/>
                    }
                    <NoteForm onNoteSubmit={this.onNoteSubmit}/>
                </div>
            </div>
        );
    }
}