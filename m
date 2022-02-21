Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3344233E4
	for <landlock@lists.linux.dev>; Mon, 21 Feb 2022 20:22:36 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sm2n.ca; s=key1;
	t=1645474570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=DLTTXVufdx2VxBKBo7T+SGErDaSjGoBhm7yK0CUq/OA=;
	b=ZsHAoVLFPs4d+196YIY6yAlrvoXjlkt63pd5Qm1eixVwHNqghMkEkQ3jU82+5DZCOyZG2X
	e2C25Ah5j4dHuyHVShxf7R8HfvxqNQFRcbu/vzgWaeYvLcdRpeETWJjKxH4UG4+rA4QrU3
	e9YREYMNkhZWC0RdPswV3+ZUsO7sZOVSpTFggR9qxQCcub5S0pxxMr6PkpS6dtEqYpGPgq
	j+5O2xueQUp+oFPnCBOxJA6sTfwGGrjOopin2pC0yG8yZeuPOiTSSf4XH2noGC88+kEOtD
	CFax4rrKFauStySc3OkB0QVbo9k7DyVSDTMGtFEX8soJVk//qbDJHsybCW2TPg==
From: "S.M Mukarram Nainar" <theone@sm2n.ca>
To: landlock@lists.linux.dev
Cc: TaylorPhebillo@gmail.com
Subject: Landlock and O_PATH
Date: Mon, 21 Feb 2022 15:16:08 -0500
Message-ID: <87v8x83rhz.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: sm2n.ca

Hi! First I want to say that I'm happy landlock exists, its featureset
was dearly missed for a while, so thanks for that.

I was recently experimenting with Landlock to see how it works, and I
had a question.

Following the example, I locked the program down as follows:

```c
  struct landlock_ruleset_attr ruleset_attr = {
    .handled_access_fs =
    /* Files */
    LANDLOCK_ACCESS_FS_EXECUTE |
    LANDLOCK_ACCESS_FS_WRITE_FILE |
    LANDLOCK_ACCESS_FS_READ_FILE |

    /* the directory */
    LANDLOCK_ACCESS_FS_READ_DIR |

    /* inside the directory */
    LANDLOCK_ACCESS_FS_REMOVE_DIR |
    LANDLOCK_ACCESS_FS_REMOVE_FILE |
    LANDLOCK_ACCESS_FS_MAKE_CHAR |
    LANDLOCK_ACCESS_FS_MAKE_DIR |
    LANDLOCK_ACCESS_FS_MAKE_REG |
    LANDLOCK_ACCESS_FS_MAKE_SOCK |
    LANDLOCK_ACCESS_FS_MAKE_FIFO |
    LANDLOCK_ACCESS_FS_MAKE_BLOCK |
    LANDLOCK_ACCESS_FS_MAKE_SYM,
  };
  int ruleset_fd = landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
  if (ruleset_fd < 0) {
    perror("no");
    return 1;
  }
  if ((prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0))) {
    perror("prctl error");
    close(ruleset_fd);
    return 1;
  }
  if (landlock_restrict_self(ruleset_fd, 0) != 0) {
    perror("can't do it");
    close(ruleset_fd);
    return 1;
  }
  int fd_dir = open("/home/asdasda/", O_PATH);
  if (fd_dir < 0) {
    perror("open dir fail");
  }
```

However, open(2) with O_PATH still works. For example:

```c
  int fd_dir = open("/home/asdasda/", O_PATH);
  if (fd_dir < 0) {
    perror("open dir fail");
  }
```
This does not fail, and can basically be used as a directory oracle. Is
  this the desired behaviour? I found it surprising and expected
  FS_READ_DIR to block this as well.

Thanks,
Mukarram
