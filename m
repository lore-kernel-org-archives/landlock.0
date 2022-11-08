Received: from saaz.rutschle.net (saaz.rutschle.net [51.15.243.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D468F78
	for <landlock@lists.linux.dev>; Tue,  8 Nov 2022 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=rutschle.net; s=20170610; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Txvs1+PQg/1ffiyQkwbl5DOBzFcBKalfD8zLdlczpoU=; b=itZfL2wIKXQvB/9ZzbAA6iaZq/
	Gze4fJeuujDrnX+KNxLW+6+2qu4McxefV7VpjdjVesI7ooQyawTb8VcsORNVktBF4dX2mYibGz5Ow
	/QQUDF/aj2Ds+EI0sWVVQS/F/G2qeKnANgqTJtHnmVnmh4O453vm42stnJWXb+c8/EWI=;
Received: from yves by saaz.rutschle.net with local (Exim 4.92)
	(envelope-from <yves@rutschle.net>)
	id 1osMlG-0003bL-6S; Tue, 08 Nov 2022 11:27:22 +0000
Date: Tue, 8 Nov 2022 11:27:22 +0000
From: Yves Rutschle <landlock@rutschle.net>
To: Yves Rutschle <landlock@rutschle.net>, landlock@lists.linux.dev
Subject: Re: Landlock setup
Message-ID: <20221108112722.GB10688@rutschle.net>
Mail-Followup-To: Yves Rutschle <landlock@rutschle.net>,
	landlock@lists.linux.dev
References: <20221107172216.GA10688@rutschle.net>
 <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Nov 07, 2022 at 07:02:04PM +0100, Mickaël Salaün wrote:
> This is correct, but you may also want to enable other LSMs if you are using
> them (e.g. Yama). You should probably stick to the new default Debian Sid
> cmdline: https://salsa.debian.org/kernel-team/linux/-/commit/1ef40f40e593a5dc223e9ce171fa8f2cd5aba198

I'm on Debian 11 on this PC, which enables... nothing.

> Your setup is good and it should work. You can debug a bit more with an
> up-to-date strace (which will print the Landlock syscalls). I guess you are
> running this sample in a strict seccomp environment that denies Landlock
> syscalls. This may be the result of using an old container runtime (Docker,
> Podman and runc are now patched but the related fix may not be backported).

strace:

[...]
mprotect(0x7f5189b04000, 16384, PROT_READ) = 0
mprotect(0x558557b7c000, 4096, PROT_READ) = 0
mprotect(0x7f5189b5c000, 8192, PROT_READ) = 0
munmap(0x7f5189b15000, 94575)           = 0
[ Process PID=3958 runs in x32 mode. ]
syscall_0x400001bc(0, 0, 0x1, 0, 0x7f5189b3d2b0, 0x40) = -1 ENOSYS (Function not implemented)
[ Process PID=3958 runs in 64 bit mode. ]
dup(2)                                  = 3
[...]

=> I guess strace is not up to date. I dont think I have
seccomp enabled either, and I think it would interrupt (as
in kill) the syscall rather than return ENOSYS. I am not
running from a docker either.


Ok, so I guess I'll look into upgrading the kernel and
strace, or compiling it myself.

Cheers,
Y.
