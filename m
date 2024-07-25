Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F715FA60
	for <landlock@lists.linux.dev>; Thu, 25 Jul 2024 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721898770; cv=none; b=ffGRFATp2EtQ/raayWWk9pNrqrp3dBjjOgCFx8YTgKwSXSIe43FCMXf+KMFeJ1dmvIr8LcyFaPAoQOsryT4XnTYvgYR31/BtIysFM1vqdj5i0Izh3Acviu4fJOXYg9Lta56+4o/dR5lDy74nxFuIv/txEKWtoApwd1GNJvBp0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721898770; c=relaxed/simple;
	bh=M1DIfw/8y8TYjl34EtfuPfTvqlwEq7Ssrj/kLCT2bM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUfihZmassEdwOy6d7O0EfBAPgSGjJRkBomDXzcmWaLEvxvX630/ohNqPSZzHixMvjVzU89HiYoQldgzJyhSGca/VXnJyxjs0eK8xYrQj0kjx6fDiDkj5A7zWMaioM9+n/adtxwk0yWjg4iyPWUfxvq28mZF6m8xc+IT/C8YMEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=NFuNHXbh; arc=none smtp.client-ip=45.157.188.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="NFuNHXbh"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WV4kw6MLxzfV5;
	Thu, 25 Jul 2024 11:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1721898408;
	bh=3YLAoaGBqf1G92r6BZ71PVCkUapElXjyM/572gLPJxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFuNHXbhfmYpdQ5VPjim8Ew0MrSVEl5SWk2o6yxDQBD41dptUaq9BvkbxUnPaa5i5
	 f3VN1fK1BmzSfk09jT6RK9tCBlSDLqtW+kXG4LWaA50brVhTMm53mO3bQ1Wsl0O0CX
	 KlWxpV25kwTPnytvGTkwCRgyWCECoNVM7v5/EP9M=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4WV4kv6McYz296;
	Thu, 25 Jul 2024 11:06:47 +0200 (CEST)
Date: Thu, 25 Jul 2024 11:06:46 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: landlock@lists.linux.dev, Petr Vorel <pvorel@suse.cz>, 
	Li Wang <liwang@redhat.com>, ltp@lists.linux.it, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Subject: Re: LTP landlock test is failing for all kernels <= 6.6
Message-ID: <20240725.Sohsez7coh2t@digikod.net>
References: <fc172149-12e9-45c3-9411-ab158fa7d747@suse.com>
 <54317d90-ec53-49ff-bbff-15200f09c8d2@suse.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54317d90-ec53-49ff-bbff-15200f09c8d2@suse.com>
X-Infomaniak-Routing: alpha

Hi Andrea,

On Thu, Jul 25, 2024 at 09:50:36AM +0200, Andrea Cervesato wrote:
> Hi all,
> 
> we are facing an issue with landlock support in kernels <=6.6. We have a
> test that takes in consideration all possible rules set and enable only one
> of them, checking that all the others are raising a permission error.
> The test can be found here:
> https://github.com/acerv/ltp/commit/9b1d6838592cebe3c89282a7339db543be2a00e7

There is definitely an issue in this commit.  ALL_RULES contains all
access right, mixing filesystem and network ones, which doesn't make
sense because they don't have the same "namespace".
LANDLOCK_ACCESS_NET_* and LANDLOCK_ACCESS_FS_* bits overlaps.
The tester_get_all_rules() function does the ABI checks and removes the
LANDLOCK_ACCESS_NET_{BIND,CONNECT}_TCP bits if they are not supported
(in the handled_access_net namespace), which is the same as removing
LANDLOCK_ACCESS_FS_{EXECUTE,WRITE_FILE} whereas they are supported (in
the handled_access_fs namespace).

> It work fine for all kernels >= 6.7.

LANDLOCK_ACCESS_NET_{BIND,CONNECT}_TCP were introduced with this kernel
(Landlock ABI 4), so I guess that's the issue.

> 
> Below you will find the discussion in the LTP mailing list. Can you please
> give any help with this?
> 
> Regards,
> Andrea
> 
> 
> 
> -------- Forwarded Message --------
> Subject: 	Re: [LTP] [PATCH v3 09/11] Add landlock04 test
> Date: 	Thu, 25 Jul 2024 09:12:39 +0200
> From: 	Andrea Cervesato <andrea.cervesato@suse.com>
> To: 	Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
> CC: 	Andrea Cervesato <andrea.cervesato@suse.de>, ltp@lists.linux.it,
> Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
> 
> 
> 
> Hi!
> 
> it seems like the landlock() support in kernel 6.6 is different than the one
> in 6.7. The reason why we see that error in kernel <=6.6 is related to how
> landlock is handling the rules set according to the rule we want to enable.
> 
> Let's suppose we want to enable the execution for a file. What we should be
> able to do, is to consider __ALL__ the rules available for landlock, then to
> enable EXEC only for a specific file. Then, if we make any other operation
> that is not EXEC, we should have a permission error. This translates to:
> 
> - set ruleset_attr->handled_access_fs for all available LANDLOCK_ACCESS_FS_*
> rules
> - set path_beneath_attr->allowed_access to LANDLOCK_ACCESS_FS_EXEC |
> LANDLOCK_ACCESS_FS_READ (we need to read in order to execute) for a binary
> - enforce the rules inside a sandbox containing the binary
> - execute the binary will work
> - do any other operation inside the sandbox and obtain a permissions error
> - at this point, any new rule that is added, will update the list of
> landlock rules, enabling the sandbox permissions
> 
> For some reasons that I don't know (and this is evident from kselftests as
> well), if the initial rules set (ruleset_attr->handled_access_fs) is not
> identical to the rules we are going to enable
> (path_beneath_attr->allowed_access), landlock_add_rule() will fail with
> EINVAL. And this is our case for all kernels <=6.6.

path_beneath_attr->allowed_access needs to be a subset of
ruleset_attr->handled_access_fs, otherwise it doesn't make sense to
allow something which is not handled/denied.

> 
> I really have no idea why this happens and maybe we need to contact the
> landlock developers.

Feel free to Cc me and Günther for all Landlock-related patches.

> 
> Andrea
> 
> On 7/24/24 15:47, Andrea Cervesato wrote:
> > Hi Li,
> > 
> > thanks for checking. Mmmh I don't know if it's because they added
> > LANDLOCK_RULE_NET_PORT. It sounds strange to me, since that would break
> > all the other features.
> > 
> > Andrea
> > 
> > On 7/24/24 14:12, Li Wang wrote:
> > > Hi Petr, Andrea,
> > > 
> > > On Wed, Jul 17, 2024 at 1:27 AM Petr Vorel <pvorel@suse.cz> wrote:
> > > 
> > >     Hi Andrea,
> > > 
> > >     ...
> > >     > +static void enable_exec_libs(const int ruleset_fd)
> > >     > +{
> > >     > +     FILE *fp;
> > >     > +     char line[1024];
> > >     > +     char path[PATH_MAX];
> > >     > +     char dependency[8][PATH_MAX];
> > >     > +     int count = 0;
> > >     > +     int duplicate = 0;
> > >     > +
> > >     > +     fp = SAFE_FOPEN("/proc/self/maps", "r");
> > >     > +
> > >     > +     while (fgets(line, sizeof(line), fp)) {
> > >     > +             if (strstr(line, ".so") == NULL)
> > >     > +                     continue;
> > >     > +
> > >     > +             SAFE_SSCANF(line, "%*x-%*x %*s %*x %*s %*d %s",
> > >     path);
> > >     > +
> > >     > +             for (int i = 0; i < count; i++) {
> > >     > +                     if (strcmp(path, dependency[i]) == 0) {
> > >     > +                             duplicate = 1;
> > >     > +                             break;
> > >     > +                     }
> > >     > +             }
> > >     > +
> > >     > +             if (duplicate) {
> > >     > +                     duplicate = 0;
> > >     > +                     continue;
> > >     > +             }
> > >     > +
> > >     > +             strncpy(dependency[count], path, PATH_MAX);
> > >     > +             count++;
> > >     > +
> > >     > +             tst_res(TINFO, "Enable read/exec permissions for
> > >     %s", path);
> > >     > +
> > >     > +             path_beneath_attr->allowed_access =
> > >     > +                     LANDLOCK_ACCESS_FS_READ_FILE |
> > >     > +                     LANDLOCK_ACCESS_FS_EXECUTE;
> > >     > +             path_beneath_attr->parent_fd = SAFE_OPEN(path,
> > >     O_PATH | O_CLOEXEC);
> > >     > +
> > >     > +             SAFE_LANDLOCK_ADD_RULE(
> > >     > +                     ruleset_fd,
> > >     > +                     LANDLOCK_RULE_PATH_BENEATH,
> > >     > +                     path_beneath_attr,
> > >     > +                     0);
> > > 
> > >     Unfortunately, on 6.6.15-amd64 kernel (random Debian machine) it
> > >     fails (after
> > >     fresh boot) with:
> > > 
> > >     ...
> > >     tst_supported_fs_types.c:97: TINFO: Kernel supports tmpfs
> > >     tst_supported_fs_types.c:49: TINFO: mkfs is not needed for tmpfs
> > >     tst_test.c:1746: TINFO: === Testing on ext2 ===
> > >     tst_test.c:1111: TINFO: Formatting /dev/loop1 with ext2 opts=''
> > >     extra opts=''
> > >     mke2fs 1.47.0 (5-Feb-2023)
> > >     tst_test.c:1123: TINFO: Mounting /dev/loop1 to
> > >     /tmp/LTP_lant6WbKJ/sandbox fstyp=ext2 flags=0
> > >     landlock_common.h:30: TINFO: Landlock ABI v3
> > >     landlock04.c:151: TINFO: Testing LANDLOCK_ACCESS_FS_EXECUTE
> > >     landlock04.c:123: TINFO: Enable read/exec permissions for
> > >     /usr/lib/i386-linux-gnu/libc.so.6
> > >     landlock04.c:131: TBROK: landlock_add_rule(3, 1, 0xf7f13ff4, 0):
> > >     EINVAL (22)
> > > 
> > > 
> > > Possibly that's because the 'LANDLOCK_RULE_PATH_BENEATH'  was
> > > refactored from the v6.7 mainline kernel, so it can't add the rule
> > > correctly
> > > with older kernels.
> > > 
> > > commit 0e0fc7e8eb4a11bd9f89a9c74bc7c0e144c56203
> > > Author: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
> > > Date:   Thu Oct 26 09:47:46 2023 +0800
> > > 
> > >     landlock: Refactor landlock_add_rule() syscall
> > > 
> > > But this is my guess (through reading the code), I didn't do more to
> > > verify that by installing such a kernel.
> > > 
> > > 
> > > -- 
> > > Regards,
> > > Li Wang
> > 
> > 
> 
> 
