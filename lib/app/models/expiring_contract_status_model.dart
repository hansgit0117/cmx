class ExpiringContractStatusModel {
  String title;
  bool isCheck;

  ExpiringContractStatusModel({this.title, this.isCheck});

  static List<ExpiringContractStatusModel> getExpiringContractStatus() {
    return <ExpiringContractStatusModel>[
      ExpiringContractStatusModel(
          title: "Draft",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Active",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Approved",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Archived",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Cancelled",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Completed",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Expired",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "External Review Completed",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Inactive/On Hold",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Requested Changes",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Sent for external Review",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Sent for Review & Approval",
          isCheck: true), 
      ExpiringContractStatusModel(
          title: "Signed",
          isCheck: true),
      ExpiringContractStatusModel(
          title: "Sent for Signature",
          isCheck: true),
    ];
  }
}