import 'package:flutter/material.dart';

class ThemePreviewScreen extends StatelessWidget {
  const ThemePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Preview'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ======================
          // TEXT
          // ======================
          Text('Text', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Headline Large', style: textTheme.headlineLarge),
          Text('Title Medium', style: textTheme.titleMedium),
          Text('Body Medium', style: textTheme.bodyMedium),
          Text('Label Small', style: textTheme.labelSmall),
          const Divider(),

          // ======================
          // BUTTONS
          // ======================
          Text('Buttons', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled'),
              ),
            ],
          ),
          const Divider(),

          // ======================
          // INPUTS
          // ======================
          Text('Inputs', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Text Field',
              hintText: 'Enter text',
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Error Field',
              errorText: 'Something went wrong',
            ),
          ),
          const Divider(),

          // ======================
          // SELECTION
          // ======================
          Text('Selection Controls', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Switch'),
            value: true,
            onChanged: (_) {},
          ),
          CheckboxListTile(
            title: const Text('Checkbox'),
            value: true,
            onChanged: (_) {},
          ),
          RadioListTile(
            title: const Text('Radio'),
            value: true,
            groupValue: true,
            onChanged: (_) {},
          ),
          const Divider(),

          // ======================
          // PROGRESS
          // ======================
          Text('Progress', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          const LinearProgressIndicator(),
          const SizedBox(height: 12),
          const CircularProgressIndicator(),
          const Divider(),

          // ======================
          // CARDS & LIST
          // ======================
          Text('Cards & Lists', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Reminder'),
              subtitle: const Text('This is a reminder item'),
              trailing: Icon(Icons.chevron_right, color: colors.onSurface),
            ),
          ),
          const Divider(),

          // ======================
          // CHIPS
          // ======================
          Text('Chips', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('Chip')),
              FilterChip(label: Text('Filter'), onSelected: null),
              ChoiceChip(label: Text('Choice'), selected: true),
            ],
          ),
          const Divider(),

          // ======================
          // SLIDER
          // ======================
          Text('Slider', style: textTheme.titleLarge),
          Slider(
            value: 0.5,
            onChanged: (_) {},
          ),
          const Divider(),

          // ======================
          // FAB & SNACKBAR
          // ======================
          Text('Feedback', style: textTheme.titleLarge),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('This is a snackbar'),
                ),
              );
            },
            child: const Text('Show Snackbar'),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
