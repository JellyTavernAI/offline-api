CREATE TABLE `books` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`dataJson` text DEFAULT '{}' NOT NULL
);
--> statement-breakpoint
CREATE TABLE `cardAiConfigs` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`cardId` text(32) NOT NULL,
	`version` integer DEFAULT 1 NOT NULL,
	`promptParts` text NOT NULL,
	FOREIGN KEY (`cardId`) REFERENCES `cards`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `cardImages` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`cardId` text(32) NOT NULL,
	`src` text NOT NULL,
	`type` integer NOT NULL,
	`order` integer DEFAULT 1 NOT NULL,
	`isDraft` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`cardId`) REFERENCES `cards`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `cardPresentations` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`cardId` text(32) NOT NULL,
	`version` integer DEFAULT 1 NOT NULL,
	`description` text,
	`shortName` text,
	`shortDescription` text,
	FOREIGN KEY (`cardId`) REFERENCES `cards`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `cards` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`name` text(128) NOT NULL,
	`visibility` integer DEFAULT 1 NOT NULL,
	`createTime` integer NOT NULL,
	`updateTime` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `starterPrompts` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`cardId` text(32) NOT NULL,
	`summary` text NOT NULL,
	`prompt` text NOT NULL,
	`initialAutoGenerate` integer DEFAULT 0 NOT NULL,
	FOREIGN KEY (`cardId`) REFERENCES `cards`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `stories` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`storyEntriesJson` text DEFAULT '[]' NOT NULL,
	`storyProvider` text DEFAULT '' NOT NULL,
	`starterPrompt` text DEFAULT '' NOT NULL,
	`storySettingsJson` text DEFAULT '{}' NOT NULL,
	`createTime` integer NOT NULL,
	`updateTime` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `storyProviderParameterConfigs` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`provider` text NOT NULL,
	`uiJson` text NOT NULL,
	`paramsJson` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `tags` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`tag` text(64) NOT NULL,
	`tagType` integer NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `tags_tag_unique` ON `tags` (`tag`);--> statement-breakpoint
CREATE TABLE `cardsBooks` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`bookId` text(32) NOT NULL,
	`cardId` text(32) NOT NULL,
	FOREIGN KEY (`bookId`) REFERENCES `books`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`cardId`) REFERENCES `cards`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `cardsBooks_bookId_cardId_unique` ON `cardsBooks` (`bookId`,`cardId`);--> statement-breakpoint
CREATE TABLE `cardsTags` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`tagId` text(32) NOT NULL,
	`cardId` text(32) NOT NULL,
	FOREIGN KEY (`tagId`) REFERENCES `tags`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`cardId`) REFERENCES `cards`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `cardsTags_tagId_cardId_unique` ON `cardsTags` (`tagId`,`cardId`);--> statement-breakpoint
CREATE TABLE `storyCardSources` (
	`id` integer PRIMARY KEY NOT NULL,
	`storyId` text(32) NOT NULL,
	`cardId` text(32) NOT NULL,
	`cardSource` text(32) NOT NULL,
	FOREIGN KEY (`storyId`) REFERENCES `stories`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `storyCardSources_storyId_cardId_unique` ON `storyCardSources` (`storyId`,`cardId`);