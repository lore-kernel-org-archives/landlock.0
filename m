Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D022580
	for <landlock@lists.linux.dev>; Wed, 31 Aug 2022 13:39:06 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MHlSS6crbzMq3cG;
	Wed, 31 Aug 2022 15:31:20 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4MHlSS3w4Fzlh8Tw;
	Wed, 31 Aug 2022 15:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1661952680;
	bh=D5G6/YeKYkyZL9JgcAtKnYJvVGn587NVVGONQF9Vug0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GtT9InjNNlaaub3AHx0bhNbC+KzyOU1b+e0reCLHjSdm4zXiajqCqfm3S7Qo+ToWI
	 MkBYqbIP+Z9u0vCWJss5Sh5nnJx7HigUSEasnTQFavJ3GzJyAj/8xfYnoBkLWHQt+Z
	 MeqqySnXVSTPYdSoHk0smAW/oyZioJcQ/riQ8Mis=
Message-ID: <2801fc80-f946-4124-7b16-cb1095ab6b5f@digikod.net>
Date: Wed, 31 Aug 2022 15:31:19 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: current landlock limitations and what it means for sandboxer
Content-Language: en-US
To: Jeff Xu <jeffxu@chromium.org>, landlock@lists.linux.dev
Cc: Jorge Lucangeli Obes <jorgelo@chromium.org>
References: <CABi2SkXXshnGiV7Tm3C-kvRn5+z26LPFdrmjT=GT39QmHSbHEw@mail.gmail.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <CABi2SkXXshnGiV7Tm3C-kvRn5+z26LPFdrmjT=GT39QmHSbHEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 31/08/2022 02:22, Jeff Xu wrote:
> Hello, Mickaël

Hello Jeff,

Thanks for these interesting questions.

> 
> I would like to dig into the limitation of landlock, to understand
> more about the design approach of using landlock for sandboxing user
> space applications.
> 
> To give a context, assume this sandboxer will implement 3 categories
> of access using landlock: RO/RW/RX for the file system.
> 
> Limitation 1> It is currently not possible to restrict some file-related
> actions accessible through these syscall families: chdir(2),
> truncate(2), stat(2), flock(2), chmod(2), chown(2), setxattr(2),
> utime(2), ioctl(2), fcntl(2), access(2). Future Landlock evolutions
> will enable them to restrict them.
> 
> Question:
> Does this mean: root or unprivileged users can use those APIs to break
> out the normal  expectation of (RO/RX/RW) ?

The root user can be multiple things, most of the time it gets all Linux 
capabilities and can then do everything. The goal of Landlock is not to 
restrict what can already be restricted by dropping capabilities, but to 
complement these native Linux interfaces. For instance, if a user is 
allowed to load arbitrary kernel code (e.g. with CAP_SYS_MODULE), then 
this user should be considered as totally unrestricted because it can 
tamper the kernel, and we first need to start with basic security 
configurations. That being said, a process running as root will get the 
same restrictions as any other user.


> 
> For example:  we assign "RO" on fileA using landlock, can application
> truncate(2) to shrink file size (thus change the content of file) ?
> 
> If that is the case, potentially, the sandboxer needs to consider
> applying additional security mechanisms.
> 
> Or, if there is a plan to address those limitations in the short term,
> then there is less to think about in sandboxer design.

The currently non-restrictable syscall families are not blocked by 
Landlock and will be allowed to do what they do if all enabled 
access-control layers allow such access (i.e. DAC, capabilites, MAC). 
Making Landlock aware of all access types is a lot of effort and will 
take time: kernel code, user space updates, exhaustive tests, fuzzing, 
documentation, reviews…

About truncate(2), currently any landlocked thread can call it and if 
DAC/capabilities/MAC allow this action, it will be allowed. 
LANDLOCK_ACCESS_FS_WRITE_FILE only enables to restrict file opening with 
write access, but the truncate access is handled differently by the 
kernel: it is treated as a metadata modification (i.e. file attribute). 
A new LANDLOCK_ACCESS_FS_TRUNCATE right will enable to restrict the 
truncate syscall family with Linux 6.1 though: 
https://lore.kernel.org/r/20220817203006.21769-1-gnoack3000@gmail.com

In the meantime, using seccomp to filter the unhandled syscalls is a 
good approach, even if there are drawbacks: 
https://blog.gnoack.org/post/pledge-on-linux/


> 
> Limitation 2> As for file renaming and linking, a sandboxed thread
> cannot modify its filesystem topology, whether via mount(2) or
> pivot_root(2). However, chroot(2) calls are not denied.
> 
> Question: Can chroot(2) be used to break out landlock policy then ?

No, chroot(2) cannot be used to bypass Landlock. chroot is not denied 
because it doesn't modify the filesystem topology (but only the view of 
the root), and it can be used to further restrict sandboxed processes. 
It should be noted that processes allowed to chroot can escape a chroot, 
but as with chdir(2), it is unrelated to the Landlock access control.


> .
> Limitation 3> Access to regular files and directories can be
> restricted by Landlock, according to the handled accesses of a
> ruleset. However, files that do not come from a user-visible
> filesystem (e.g. pipe, socket), but can still be accessed through
> /proc/<pid>/fd/*, cannot currently be explicitly restricted.
> 
> Questions:
> Is this a feature Gap compared with SELinux ?
> Is there a plan to add the support for files under /proc ?

/proc/<pid>/ are implicitly restricted by Landlock. Indeed, sandboxed 
processes cannot access resources (e.g. opened file descriptors, 
memory…) from processes pertaining to parent or sibling domains (a 
sandbox may be seen as a stack of domains). This domain scoping is 
required to forbid process/domain impersonation that could result in 
privilege escalation.

Some special files from /proc/<pid>/ may not be explicitly restricted by 
Landlock, but it should not be an issue. Please let me know if you have 
a use case that requires to restrict them more than they already are.

SELinux implicitly labels such files (e.g. FD pseudo symlinks) with the 
process's domain. The access restrictions are then pretty similar to 
what Landlock does, except that there is no way with Landlock to bypass 
such domain scoped restrictions.


> Is pipe/socket related to network access-control types in the roadmap ?

Named pipes and named sockets can be restricted by all Landlock versions 
though. I'm not sure it would be useful to add more restrictions to the 
/proc/<pid>/fd/* (special) symlinks because a process can only access 
the underlying files if it is in the same domain or a parent one.

FYI, there is also an ongoing effort to handle TCP sockets: 
https://lore.kernel.org/linux-security-module/20220829170401.834298-1-konstantin.meskhidze@huawei.com/


> 
> Limitation 4> Likewise, some special kernel file systems such as nsfs,
> which can be accessed through /proc/<pid>/ns/*, cannot currently be
> explicitly restricted. However, thanks to the ptrace restrictions,
> access to such sensitive /proc files are automatically restricted
> according to domain hierarchies. Future Landlock evolutions could
> still explicitly restrict such paths with dedicated ruleset flags.
> 
> Question:
> This seems to say /proc/<pid>/ns/* can be protected by having the
> right value in YAMA config, right ?

This is unrelated to Yama, but quite similar. Instead of relying on 
process hierarchy like Yama can do, Landlock relies on domain 
hierarchies. A Landlock domain cannot access sensitive /proc/* files 
from outside its domain or its child domains.


> And just for my curiosities:  Are there other file types under /proc/
> that are not mentioned here (pipe/socket/ns), and need to be
> considered during this sandboxer design ?

There are other files but all sensitive files should be handled by 
Landlock (and other kernel subsystems). See 
kernel/ptrace.c:ptrace_may_access() calls. You can easily check that 
with the sandboxer tool.

BTW, /proc can be mounted with "hidepid=2", which makes invisible the 
directories of all processes not in the domain's scope.


> 
> Question > This question is not about a limitation.
> Landlock is designed for unprivileged user processes (this is great!)
> 
> How about using it for root (user with SYS_ADMIN cap),  Can root break
> out of the Landlock policy in theory?

Any user with powerful capabilities such as CAP_SYS_ADMIN are 
legitimately allowed to bypass most Linux access controls. Landlock 
always denies some actions (e.g. mounts) to sandboxed processes, but 
powerful capabilities could be leveraged to bypass such restrictions. 
Processes with such capabilities are not part of the current Landlock 
threat model. However, using Landlock in this case could still be 
interesting from a safety point of view.

For instance, the (sandboxed) root user may be allowed to create a new 
service that may be launched by a non-sandboxed process, which could 
then do whatever the root user wants. Sandboxing a user that 
legitimately needs such power seems inappropriate, and we cannot really 
answer such question without a specific context.

Linux has multiple ways to restrict processes (e.g drop capabilities) 
and Landlock is only filling an (important) gap in this set of features. 
Anyway, most Linux capabilities are too coarse and their use should be 
replaced with the use of tailored brokers. Some examples: 
https://forums.grsecurity.net/viewtopic.php?f=7&t=2522

Regards,
  Mickaël

> 
> 
> Thanks
> Best Regards,
> Jeff Xu
