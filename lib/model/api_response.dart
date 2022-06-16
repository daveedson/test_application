

class ApiDataResponse<T> {
  late Status status;
  T? data;
  String? message;
  ApiDataResponse.idle() : status = Status.IDLE;

  ApiDataResponse.loading(this.message) : status = Status.LOADING;

  ApiDataResponse.empty(this.message) : status = Status.EMPTY;

  ApiDataResponse.completed(this.data) : status = Status.COMPLETED;

  ApiDataResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR, IDLE, EMPTY }
