Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E60C33FB
	for <landlock@lists.linux.dev>; Mon, 21 Feb 2022 22:16:48 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4K2bHp1lj6zMprg2;
	Mon, 21 Feb 2022 22:37:42 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4K2bHn5zFZzlhRVr;
	Mon, 21 Feb 2022 22:37:41 +0100 (CET)
Message-ID: <155b9df6-8557-cd3e-1a59-6a852340a3d7@digikod.net>
Date: Mon, 21 Feb 2022 22:47:35 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: "S.M Mukarram Nainar" <theone@sm2n.ca>, landlock@lists.linux.dev
Cc: TaylorPhebillo@gmail.com
References: <87v8x83rhz.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: Landlock and O_PATH
In-Reply-To: <87v8x83rhz.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi!

On 21/02/2022 21:16, S.M Mukarram Nainar wrote:
> Hi! First I want to say that I'm happy landlock exists, its featureset
> was dearly missed for a while, so thanks for that.

Thanks!

> 
> I was recently experimenting with Landlock to see how it works, and I
> had a question.
> 
> Following the example, I locked the program down as follows:
> 
> ```c
>    struct landlock_ruleset_attr ruleset_attr = {
>      .handled_access_fs =
>      /* Files */
>      LANDLOCK_ACCESS_FS_EXECUTE |
>      LANDLOCK_ACCESS_FS_WRITE_FILE |
>      LANDLOCK_ACCESS_FS_READ_FILE |
> 
>      /* the directory */
>      LANDLOCK_ACCESS_FS_READ_DIR |
> 
>      /* inside the directory */
>      LANDLOCK_ACCESS_FS_REMOVE_DIR |
>      LANDLOCK_ACCESS_FS_REMOVE_FILE |
>      LANDLOCK_ACCESS_FS_MAKE_CHAR |
>      LANDLOCK_ACCESS_FS_MAKE_DIR |
>      LANDLOCK_ACCESS_FS_MAKE_REG |
>      LANDLOCK_ACCESS_FS_MAKE_SOCK |
>      LANDLOCK_ACCESS_FS_MAKE_FIFO |
>      LANDLOCK_ACCESS_FS_MAKE_BLOCK |
>      LANDLOCK_ACCESS_FS_MAKE_SYM,
>    };
>    int ruleset_fd = landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
>    if (ruleset_fd < 0) {
>      perror("no");
>      return 1;
>    }
>    if ((prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0))) {
>      perror("prctl error");
>      close(ruleset_fd);
>      return 1;
>    }
>    if (landlock_restrict_self(ruleset_fd, 0) != 0) {
>      perror("can't do it");
>      close(ruleset_fd);
>      return 1;
>    }
>    int fd_dir = open("/home/asdasda/", O_PATH);
>    if (fd_dir < 0) {
>      perror("open dir fail");
>    }
> ```
> 
> However, open(2) with O_PATH still works. For example:
> 
> ```c
>    int fd_dir = open("/home/asdasda/", O_PATH);
>    if (fd_dir < 0) {
>      perror("open dir fail");
>    }
> ```
> This does not fail, and can basically be used as a directory oracle. Is
>    this the desired behaviour? I found it surprising and expected
>    FS_READ_DIR to block this as well.

That is correct, the current Landlock implementation relies on the LSM 
path hooks, and some filesystem actions are not handled. See the warning 
section in 
https://docs.kernel.org/userspace-api/landlock.html#filesystem-flags
Opening a file or a directory with O_PATH cannot currently be denied 
with Landlock and it is the same with AppArmor and Tomoyo. It may sound 
scary but a file descriptor opened with O_PATH can only be used to refer 
to a path (with *at syscalls), it does not give access to the underlying 
file or directory content.

You're right that it may be used as an oracle to find file or 
directories, and this can also be done with syscalls such as chdir, 
access or stat. The current goal of Landlock is to protect access to 
data, which are in files, but it would be nice to also protect metadata 
such as path existence.

I plan to fill this gap with new versions of Landlock, but I'll have to 
patch the existing LSM framework.

Regards,
  Mickaël
