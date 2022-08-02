class ApiResponse<T> {
  late Status status;
  late String massage;
  late T data;

  ApiResponse.intial(this.massage) : status = Status.intial;
  ApiResponse.loading(this.massage): status = Status.loading;
  ApiResponse.completed(this.data): status = Status.completed;
  ApiResponse.error(this.massage): status = Status.error;
}

enum Status { intial, loading, completed, error }
