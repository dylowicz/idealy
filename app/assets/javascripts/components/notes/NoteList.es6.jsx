const React = require('react');
const NoteContainer = require('./NoteContainer.es6.jsx');

const NoteList = ({notes, onNoteEditSaveClick, onNoteDeleteClick}) => (
    <div className="list-unstyled" id="notes-list">
        {
            notes.map(note =>
                <NoteContainer
                    key={note.id}
                    note={note}
                    onNoteEditSaveClick={onNoteEditSaveClick}
                    onNoteDeleteClick={() => onNoteDeleteClick(note.id)}
                />
            )
        }
    </div>
);

module.exports = NoteList;
