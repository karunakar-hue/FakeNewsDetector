// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FakeNewsDetector {
    // Struct to store news details
    struct News {
        string title;
        string content;
        string language;
        bool isFake;
        address reporter;
    }

    News[] public newsList;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    // Function 1: Submit news for verification
    function submitNews(string memory _title, string memory _content, string memory _language) public {
        newsList.push(News({
            title: _title,
            content: _content,
            language: _language,
            isFake: false,
            reporter: msg.sender
        }));
    }

    // Function 2: Mark news as fake (only admin)
    function markFake(uint _index) public {
        require(msg.sender == admin, "Only admin can mark news as fake");
        require(_index < newsList.length, "Invalid index");
        newsList[_index].isFake = true;
    }

    // Function 3: Get total number of news submitted
    function totalNews() public view returns (uint) {
        return newsList.length;
    }

    // Function 4: Fetch news by index
    function getNews(uint _index) public view returns (string memory, string memory, string memory, bool, address) {
        require(_index < newsList.length, "Invalid index");
        News memory n = newsList[_index];
        return (n.title, n.content, n.language, n.isFake, n.reporter);
    }
}
