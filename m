Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0952EC0A7
	for <landlock@lists.linux.dev>; Fri, 21 Aug 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302006; cv=none; b=Gdi4Q0+wc3QbJK/hXVeeZ1KEI7674xkcWD2vz/ejyje3TufVnvmBToeLs48NTTWUStdXaWd8j7PkvVAB3VBJ8wg8cyaCwkgAz/FoZZa82667U22pv70S+RYId1m+jcNYkfVayQ2OdvpExOS/UuCTUdrNv74UNvPfZWYbSEHvgcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302006; c=relaxed/simple;
	bh=Eehmdq/cwKdFSt4fuGlywLVP+UhsLpFW1g4NljKpWKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJwb5w3HDEdCXqZBP7VrGIa94Y7QSY9CKYrHm7vayvi9UW+PNODAW0EvzZCkQvmFH6YwbTf9i1lFtgkoog3jVx/rLggtjcZB/p5KeD0rglB0LzaNz++Yzt0XIbhn0vYAmUKn+K/fMuORYYwRePQrO2Cm3mJXnI/NqDN/jFV7gAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyA+AG/Q; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyA+AG/Q"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c207cb16cf5so120828666b.1
        for <landlock@lists.linux.dev>; Fri, 21 Aug 2026 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787302003; x=1787906803; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBtGRQ1IxGgOhC231V7V/ddLTuQCk5/OJatWTrYScX0=;
        b=NyA+AG/QeiaSdEsfc76CDR0pVOP83+PCHkawnTFxw6Tl6JhR57whg0N+9CYNqtNFzV
         Wx1nZ4O7RT5ZoqDRC7EdCLrfsKYijNU7aHXeEGTmweqd5uhThIhC2h6p5l+lQ2+FuuKL
         wSejtjqwZWGKsheNqJPX8LjwSBKc9INDywc2tsXvvvIcrgDONQj9odS/8P/ST5OAhEYv
         Bw4cJtu/b3QRSKh/q/CSkG/mcfe1CvdfJonQmcxiACJr2yl+lJPGvW3pMCTpmbJU1KCi
         wDvsxJwF449bx7wJLYvl7STXN8BiXR92sJdfquNoeqHdJ1+FYKIewLLMOq/s1QnFWZIP
         M9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787302003; x=1787906803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rBtGRQ1IxGgOhC231V7V/ddLTuQCk5/OJatWTrYScX0=;
        b=b0PKGUvURrvf5FRpuoxvzKtZzAtaR2JD5YAhAij8DhoyUsLXCHWKLsCB/guzTM2FZz
         IxFfDsJmEu/DDIM91PAW/pniPOTM91Z1EZwhHtcujqfOPQCSC+Lqfe7sqC4wrT7i8sKP
         HeqlBmWuUKVsq65Ndgugxjcc4SWOzbzpTXRMcbm/e4OuhtB2jbSmNHbQeH0AlG2rHKSa
         VjcoHAXhgHvq78AWAhmxFxkY/vcWUz8OIYd7vz32Ebvi0k6vsc02eUSatuuYexxdTVpC
         +t9EbXwXJoiRgGwimBSDcNfbaGbDtu9cTsicTXU9xzk3DH03QC7CqDyZU6uQ9OWWQIpF
         tsow==
X-Forwarded-Encrypted: i=1; AHgh+RplIbuQ/u+H4Q55ihvrH3fBuz8II15qsjH5xA3p1+tF1W+BDu382DK3yyQKHJpM7fYYrE9JoQUaiw==@lists.linux.dev
X-Gm-Message-State: AFuF++ly8Sqnxq5MuKVKKtipre2d0AueOt0/bgfXoO3e9yZzKrbCGU8l
	VOAPIgl8lpeBePA3+DuZqZ4IHHtVRa1yMEqLWrFuMeRgHHdhwRC9mEg4
X-Gm-Gg: AR+sD11T9ZwmEM/NcaLUxCIWF0I3ovNWChlHrJpZqai+0DQmatEk0bO4qn02YnGAQdB
	EmlEfmvq+2w9QdJOnOltdWI9PvM84DMZs9kdJb8dVaSq0lDoYitq365Hw0RBtLljbgMqyPqOq1m
	iMaZwWBNHVC4L8i85lOVBRm0Ykjb8LYL9yuN7LIhTYPLb7QljH+mRj0Olj/qHmZIsCSGxmTFs/K
	TKfJhZv1QAIDJD+fKseMxrHRvZyJVc6EZlhxAS5GIxEVhzSlu4yHQtZ7nshOwuplypn/sne/UJq
	V0aGLRY2Y1n+NcudS4RahO0ai8mLhCINimtl08TMsJYLiFEljxz5Ww8+XB2g7DgXEj6edqtTkTg
	aeof11Tq+pGMMj5xXVy85F+H2WLl/eBGo2+8trIkeHXLvhqIHAUNUhdPTwru7OAazRf9M59YPyK
	/fbo9jcUGhawNw2eZXtVj8iFoY7nwT4mEq6lPQF4PjQQIcHsVLaQIqJo5N19eiCsPLpRo74wEnd
	nHfxXS1kVq1bQ==
X-Received: by 2002:a17:907:d07:b0:c21:8723:276 with SMTP id a640c23a62f3a-c246a626564mr477559666b.15.1787302002778;
        Fri, 21 Aug 2026 01:46:42 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b09349sm358410666b.19.2026.08.21.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:46:42 -0700 (PDT)
Date: Fri, 21 Aug 2026 10:46:37 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Oxana Kharitonova <oxana@cloudflare.com>
Cc: mic@digikod.net, gnoack@google.com, paul@paul-moore.com,
	jmorris@namei.or, serge@hallyn.com, wangyan01@kylinos.cn,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	landlock@lists.linux.dev, webprosto@gmail.com
Subject: Re: [PATCH 0/6] landlock: Add POSIX message queue scoping
Message-ID: <20260821.d42cd4b82f91@gnoack.org>
References: <20260722122952.42149-1-oxana@cloudflare.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722122952.42149-1-oxana@cloudflare.com>

Hello Oxana!

On Wed, Jul 22, 2026 at 01:29:36PM +0100, Oxana Kharitonova wrote:
> This series adds landlock support for scoping POSIX message queuesi [1].
>  
> Landlock already supports scoped IPC restrictions for signals and abstract
> UNIX sockets. These restrictions make it possible to prevent a sandboxed
> task from interacting with IPC objects outside of its Landlock domain,
> while still allowing communication within the same domain or with nested
> domains.
>  
> This series extends the same model to POSIX message queues with a new
> LANDLOCK_SCOPE_POSIX_MSG_QUEUE scope. When this scope is enforced, a task
> can only open POSIX message queues that were created by a task in the same
> landlock domain or in a nested domain.
>  
> The implementation tags mqueuefs inodes at creation time with the creator's
> landlock domain. This domain is kept alive for the lifetime of the inode
> and is checked when the queue is opened.
>  
> The series also exposes the mqueuefs magic number through the shared UAPI
> magic header, bumps the Landlock ABI, updates documentation, adds sandboxer
> support, and adds selftests.
>  
> The new behavior is:
>  
> - a task restricted with LANDLOCK_SCOPE_POSIX_MSG_QUEUE cannot open a queue
>   created outside of its Landlock scope;
> - a task can still open a queue created within its own Landlock domain;
> - queues created outside of any Landlock domain are treated as outside the
>   scope for a scoped opener.

Thank you for sending this!

I have a high level question about this patch set:

You are adding a check to hook_file_open(), but the existing
hook_file_open() can already prevent mq_open().

The following experiment illustrates this:
* Restrict LANDLOCK_ACCESS_FS_READ_FILE and LANDLOCK_ACCESS_FS_WRITE_FILE
* Try to run mq_open("/foobar", O_CREAT...)

Depending on the installed PATH_BENEATH rules, you now see differing behaviour:

* If we allow READ_FILE and WRITE_FILE on nothing, mq_open() is *DENIED*.
* If we allow READ_FILE and WRITE_FILE on /, mq_open() is *DENIED*.
* If we allow READ_FILE and WRITE_FILE on a mounted /dev/mqueue, mq_open() is *ALLOWED*.

So it seems that the existing file system restrictions are already
preventing POSIX message queues from being opened?  And not only that
-- since such Landlock policies are already quite common, it seems
likely that many existing landlocked programs are already restricting
opening of POSIX message queues today.

So, to clarify:

* What your patch set is adding is only that we are now additionally
  taking the Landlock domain scope into account?
* This distinction only makes a difference for landlocked programs
  that do not restrict READ_FILE/WRITE_FILE or that do restrict it and
  then allow-list READ_FILE/WRITE_FILE on a previously mounted
  /dev/mqueue.

Maybe this would be interesting to clarify a bit more prominently in
the cover letter, because it reduces the applicability of this
patchset?

Attached below is a LLM-generated (but double checked) test program
which you can use to try out the creation of mqueues.  (As first
argument, use "-", "/" or "/dev/mqueue".)

What *might* still be interesting to restrict though: While mq_open()
checks the READ_FILE and WRITE_FILE rights, it checks none of the
LANDLOCK_ACCESS_FS_MAKE_* rights -- the message queue gets still
created, even when the mq_open() is denied and returns with an error.

To expand on Justin's comment in [1] -- it feels that there are maybe
still some gaps in the "lifecycle management" of these message queues
that might be worth thinking systematically about, because both
mq_unlink() and the creation of the message queue entries are
currently apparently not restrictable yet?  It makes me wonder whether
hijacking of message queue names (creating same-named queues in other
Landlock domains) is a problem then?  Do you have thoughts on this?

Thanks,
–Günther

[1] https://lore.kernel.org/all/amKDYoOSvHMzVbKX@suesslenovo/


--- llmq.c
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <linux/landlock.h>
#include <mqueue.h>
#include <stdio.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/syscall.h>
#include <unistd.h>

static int ll_create(const struct landlock_ruleset_attr *a, size_t s, __u32 f)
{ return syscall(__NR_landlock_create_ruleset, a, s, f); }
static int ll_add(int fd, enum landlock_rule_type t, const void *a, __u32 f)
{ return syscall(__NR_landlock_add_rule, fd, t, a, f); }
static int ll_self(int fd, __u32 f)
{ return syscall(__NR_landlock_restrict_self, fd, f); }

#define RW (LANDLOCK_ACCESS_FS_READ_FILE | LANDLOCK_ACCESS_FS_WRITE_FILE)

int main(int argc, char **argv)
{
	const char *grant = argv[1];		/* path to allow, or "-" for none */
	struct landlock_ruleset_attr rsa = { .handled_access_fs = RW };
	int rs = ll_create(&rsa, sizeof(rsa), 0);
	mqd_t mq;
	int f;

	if (rs < 0) { perror("create_ruleset"); return 1; }

	if (strcmp(grant, "-") != 0) {
		struct landlock_path_beneath_attr pb = { .allowed_access = RW };
		pb.parent_fd = open(grant, O_PATH | O_CLOEXEC);
		if (pb.parent_fd < 0) { perror(grant); return 1; }
		if (ll_add(rs, LANDLOCK_RULE_PATH_BENEATH, &pb, 0)) {
			perror("add_rule"); return 1;
		}
		close(pb.parent_fd);
	}

	if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0)) { perror("nnp"); return 1; }
	if (ll_self(rs, 0)) { perror("restrict_self"); return 1; }

	printf("granted=%-12s ", grant);

	/* sanity: a normal file open, to prove the rule itself works */
	f = open("/etc/hostname", O_RDONLY);
	printf("open(/etc/hostname)=%-14s ",
	       f >= 0 ? "OK" : strerror(errno));
	if (f >= 0) close(f);

	mq = mq_open("/foobar", O_CREAT | O_RDWR, 0600, NULL);
	printf("mq_open()=%s\n", mq != (mqd_t)-1 ? "OK" : strerror(errno));
	if (mq != (mqd_t)-1) mq_close(mq);
	return 0;
}
---
