import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpertfunding/components/status_badge.dart';
import 'package:xpertfunding/model/challenge.dart';

import 'detail_row.dart';
import 'pro_badge.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const ChallengeCard({Key? key, required this.challenge}) : super(key: key);

  String _getStatusText() {
    if (challenge.currentPhase == null) return 'Unknown';
    if (challenge.currentPhase == 0) return 'Funded';
    return 'On Challenge';
  }

  Color _getStatusColor() {
    if (challenge.currentPhase == null) return const Color(0xFF6B7280);
    if (challenge.currentPhase == 0) return const Color(0xFF00C851);
    return const Color(0xFF4A90E2);
  }

  String _getEvaluationText() {
    if (challenge.currentPhase == null) return 'Unknown';
    if (challenge.currentPhase == 0) return 'Master Account';
    return 'Evaluation ${challenge.currentPhase}';
  }

  Color _getEvaluationColor() {
    if (challenge.currentPhase == null) return const Color(0xFF6B7280);
    if (challenge.currentPhase == 0) return const Color(0xFF8E44AD);
    return const Color(0xFF4A90E2);
  }

  String _formatCurrency(double? amount) {
    if (amount == null) return '\$0';
    return '\$${NumberFormat('#,###').format(amount)}';
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('MMM dd,yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2332),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A3441), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with badges
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                StatusBadge(
                  text: _getStatusText(),
                  color: _getStatusColor(),
                  isFunded: challenge.currentPhase == 0,
                ),
                const SizedBox(width: 8),
                StatusBadge(
                  text: _getEvaluationText(),
                  color: _getEvaluationColor(),
                  isFunded: challenge.currentPhase == 0,
                ),
              ],
            ),
          ),
          // Title and PRO badge
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  challenge.accountName ?? 'Two Step Challenge',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                if (challenge.isProAccount == true) const ProBadge(),
              ],
            ),
          ),
          // Amount
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              _formatCurrency(challenge.size),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DetailRow(
                  label: 'Balance:',
                  value: _formatCurrency(challenge.balance),
                ),
                const SizedBox(height: 8),
                DetailRow(
                  label: 'Equity:',
                  value: _formatCurrency(challenge.equity),
                ),
                const SizedBox(height: 8),
                DetailRow(
                  label: 'Created:',
                  value: _formatDate(challenge.createdAt),
                  hasIcon: true,
                ),
                const SizedBox(height: 8),
                DetailRow(
                  label: 'ID:',
                  value: challenge.id ?? 'N/A',
                  hasIcon: true,
                ),
                if (challenge.numPhases != null) ...[
                  const SizedBox(height: 8),
                  DetailRow(
                    label: 'Phases:',
                    value:
                        '${(challenge.currentPhase ?? 0) + 1}/${challenge.numPhases}',
                  ),
                ],
              ],
            ),
          ),
          // Dashboard button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: challenge.active == true ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: challenge.active == true
                      ? Colors.white
                      : const Color(0xFF374151),
                  foregroundColor: challenge.active == true
                      ? Colors.black
                      : const Color(0xFF9CA3AF),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dashboard_outlined,
                      size: 18,
                      color: challenge.active == true
                          ? Colors.black
                          : const Color(0xFF9CA3AF),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      challenge.active == true ? 'Dashboard' : 'Inactive',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
