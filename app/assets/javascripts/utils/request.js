class Request {
    static get(url) {
        //todo
    }

    static post(url, data) {
        //todo
    }

    static patch(url, data) {
        $.ajax({
            url: url,
            method: "PATCH",
            data: data,
            dataType: 'json',
            success: (data) => {}
        });
    }

    static delete(url, data) {
        //todo
    }
}