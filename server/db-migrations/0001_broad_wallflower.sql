ALTER TABLE `cards` ADD `isDraft` integer DEFAULT 0 NOT NULL;--> statement-breakpoint
ALTER TABLE `stories` ADD `cardSourcesJson` text;--> statement-breakpoint
ALTER TABLE `cardAiConfigs` DROP COLUMN `version`;--> statement-breakpoint
ALTER TABLE `cardPresentations` DROP COLUMN `version`;