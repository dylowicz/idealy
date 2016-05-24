const NoteList = ({notes, onNoteDeleteClick}) => (
    <div className="list-group" id="note-list">
        {
            notes.map(note =>
                <Note
                    key={note.id}
                    {...note}
                    onNoteDeleteClick={() => onNoteDeleteClick(note.id)}
                />
            )
        }
    </div>
);