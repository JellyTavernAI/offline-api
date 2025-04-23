CREATE TABLE `cardCardImages` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`imageId` text(32) NOT NULL,
	`cardId` text(32) NOT NULL,
	FOREIGN KEY (`imageId`) REFERENCES `cardImages`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`cardId`) REFERENCES `cards`(`id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `cardCardImages_imageId_cardId_unique` ON `cardCardImages` (`imageId`,`cardId`);--> statement-breakpoint
PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_cardImages` (
	`id` text(32) PRIMARY KEY NOT NULL,
	`src` text NOT NULL,
	`type` integer NOT NULL,
	`order` integer DEFAULT 1 NOT NULL,
	`isDraft` integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
INSERT INTO `__new_cardImages`("id", "src", "type", "order", "isDraft") SELECT "id", "src", "type", "order", "isDraft" FROM `cardImages`;--> statement-breakpoint
DROP TABLE `cardImages`;--> statement-breakpoint
ALTER TABLE `__new_cardImages` RENAME TO `cardImages`;--> statement-breakpoint
PRAGMA foreign_keys=ON;