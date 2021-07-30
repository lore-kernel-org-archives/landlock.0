Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613A472
	for <landlock@lists.linux.dev>; Fri, 30 Jul 2021 14:57:00 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4GbqmD1BM3zMqHk4;
	Fri, 30 Jul 2021 16:39:24 +0200 (CEST)
Received: from localhost (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4GbqmC6S5kzlmrs8;
	Fri, 30 Jul 2021 16:39:23 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Alejandro Colomar <alx.manpages@gmail.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jann Horn <jannh@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <keescook@chromium.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
	landlock@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-man@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>
Subject: [PATCH v3 0/4] Add Landlock man pages
Date: Fri, 30 Jul 2021 16:41:12 +0200
Message-Id: <20210730144116.332091-1-mic@digikod.net>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mickaël Salaün <mic@linux.microsoft.com>

Hi,

These four documents give a global overview of Landlock and explain each
system calls.  This is mainly a formatting of the current kernel
documentation with some new additional details.

This third patch series mostly fixes formatting pointed out by Alejandro
Colomar.

This patch series can be found in a Git repository:
https://github.com/landlock-lsm/man-pages/commits/landlock-v3

Previous version:
https://lore.kernel.org/linux-man/20210712155745.831580-1-mic@digikod.net/

Regards,

Mickaël Salaün (4):
  landlock.7: Add a new page to introduce Landlock
  landlock_create_ruleset.2: Document new syscall
  landlock_add_rule.2: Document new syscall
  landlock_restrict_self.2: Document new syscall

 man2/landlock_add_rule.2       | 144 +++++++++++++
 man2/landlock_create_ruleset.2 | 139 +++++++++++++
 man2/landlock_restrict_self.2  | 133 ++++++++++++
 man7/landlock.7                | 361 +++++++++++++++++++++++++++++++++
 4 files changed, 777 insertions(+)
 create mode 100644 man2/landlock_add_rule.2
 create mode 100644 man2/landlock_create_ruleset.2
 create mode 100644 man2/landlock_restrict_self.2
 create mode 100644 man7/landlock.7


base-commit: fbe71b1b79e72be3b9afc44b5d479e7fd84b598a
-- 
2.32.0

