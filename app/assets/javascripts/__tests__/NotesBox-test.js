jest.unmock("../NotesBox");

describe('NotesBox', () => {
  it('says hello', () => {
    const NotesBox = require('../NotesBox');
    console.log("Hello my first test!");
  });
});
