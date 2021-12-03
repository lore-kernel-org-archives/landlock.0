Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037A72CA2
	for <landlock@lists.linux.dev>; Fri,  3 Dec 2021 18:58:51 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4J5MNr4NlczMqT4M;
	Fri,  3 Dec 2021 19:51:24 +0100 (CET)
Received: from localhost (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4J5MNr1f4Lzlh8TJ;
	Fri,  3 Dec 2021 19:51:23 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: kernel-team@lists.ubuntu.com
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Tyler Hicks <code@tyhicks.com>,
	landlock@lists.linux.dev
Subject: [PATCH v1 0/1] Enable Landlock by default
Date: Fri,  3 Dec 2021 19:52:25 +0100
Message-Id: <20211203185226.1957311-1-mic@digikod.net>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

The Landlock security feature is built in Ubuntu kernel since 5.13 which
is great!  However, it is not enough to enable the
CONFIG_SECURITY_LANDLOCK option as described in the related help.  The
CONFIG_LSM option needs to be prepended by "landlock," to make Landlock
system calls available without modifying the kernel boot arguments.

Could you please apply the attached patch to make this feature more
broadly available?

This can be validated with the tests provided by the kernel sources:

fakeroot make -C tools/testing/selftests TARGETS=landlock gen_tar
tar -xf
tools/testing/selftests/kselftest_install/kselftest-packages/kselftest.tar.gz
# as root:
./run_kselftest.sh

If Yama is enabled, half of the ptrace tests may failed, which is OK.

Regards,

Mickaël Salaün (1):
  UBUNTU: [Config] Enable Landlock by default

 debian.master/config/config.common.ubuntu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 86d5f4d4ce66d96657de67b735dacb25b8ab8a1b
-- 
2.33.1

