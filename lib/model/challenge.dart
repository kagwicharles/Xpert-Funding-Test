class Challenge {
  final String? id;
  final DateTime? createdAt;
  final double? balance;
  final double? equity;
  final String? accountName;
  final int?
  currentPhase; // 0 means funded, 1 means evaluation1, 2 means evaluation2, ...
  final int? numPhases;
  final double? size;
  final bool? active;
  final bool? isProAccount;

  Challenge({
    this.id,
    this.createdAt,
    this.balance,
    this.equity,
    this.accountName,
    this.currentPhase,
    this.numPhases,
    this.size,
    this.active,
    this.isProAccount,
  });
}
