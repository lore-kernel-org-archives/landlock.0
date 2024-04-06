Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A523FBA5
	for <landlock@lists.linux.dev>; Sat,  6 Apr 2024 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712424350; cv=none; b=MhOUdHKAz6AwPX7xbLGtx+LRLhtyPARDzFWRrmapIjbomrdEuDhyNC13deSQezwoHKVEwYmxxk1DmSgLcy4Sfw3MnFGaU30FEOi/QUg7HLS5G2hjXC8Q2eOIfnVMnDyJIXnC5wyUsPYHm+aOp2t/lpv7SKS+e8bCrrJC/PjhPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712424350; c=relaxed/simple;
	bh=NLv19xgx+73m5A0h6PXhXTa9mz6sUVCw5hdUpSLQSMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPvlw8cwQwCE691YUyka+VGyq5mIZ07Dt6m7EtsnRQTkdDF9cAAIUNpZ4MfWz/RHing7zBUdgKE1XuPdo4D6YwcaMNB6tPO1K0G0HFAdnKi4cVWxv1cdxyGNVQoine3zfS/YbG7Sn7yPrFoF/BvQ9idbt3ATitEYM0npKUabCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=RXE2R3eb; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="RXE2R3eb"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VBhsq4Yy8zXst;
	Sat,  6 Apr 2024 19:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1712423951;
	bh=NLv19xgx+73m5A0h6PXhXTa9mz6sUVCw5hdUpSLQSMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXE2R3ebON/KEpZCfy6G3/QMcpjHt9h2fHZZ6Cke/Al3UTKaK0++6n3PsyQ8lV+KR
	 fMZUhz5t22tAuIvsfuomvsP+WsjAS2V0ddyDShHDgHrhHOe461ujQ8SZK+LS7CuWDV
	 iBdZoasbFJ5XgYJdwkjHSkdTeITPgzD25MfptvMk=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4VBhsq1KmxzfQt;
	Sat,  6 Apr 2024 19:19:11 +0200 (CEST)
Date: Sat, 6 Apr 2024 19:19:10 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: landlock@lists.linux.dev
Subject: Re: R/O protection for lower level dirs
Message-ID: <20240406.baeVa4ugh9Ve@digikod.net>
References: <20240401160614.32py2wrijdp5yots@altlinux.org>
 <20240402.quaQuieyohd9@digikod.net>
 <20240403152043.fc5gpqu2ghlahyyj@altlinux.org>
 <20240403.Taip4yae2ohn@digikod.net>
 <20240405160409.is4wrceb6dyivujf@altlinux.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405160409.is4wrceb6dyivujf@altlinux.org>
X-Infomaniak-Routing: alpha

On Fri, Apr 05, 2024 at 07:04:09PM +0300, Vitaly Chikunov wrote:
> Mickaël, Simon,
> 
> On Wed, Apr 03, 2024 at 06:57:06PM +0200, Mickaël Salaün wrote:
> > On Wed, Apr 03, 2024 at 06:20:43PM +0300, Vitaly Chikunov wrote:
> > > On Tue, Apr 02, 2024 at 11:11:39AM +0200, Mickaël Salaün wrote:
> > > > On Mon, Apr 01, 2024 at 07:06:14PM +0300, Vitaly Chikunov wrote:
> > > > > 
> > > > > I want to ensure that some deeper directory is write protected (as a non
> > > > > security measure but so that some post-install processing do not
> > > > > accidentally touch installed files).  Is there a way to achieve this
> > > > > with Landlock?
> > > > 
> > > > Landlock follows a deny-by-default policy, which is a good practice for
> > > > access control.  In your example, you'll need to identify the set of
> > > > file hierarchies that should be legitimately allowed, and set the
> > > > appropriate access rights on them, not the other way around.
> > > > 
> > > > > 
> > > > > For example, if we do R/W access to / (root tree is already protected
> > > > > enough with DAC) and then R/O access to /home we still get full R/W access
> > > > > everywhere and /home seems not restricted. Also, Landlock does not warn for
> > > > > such configuration, silently accepting it as valid.
> > > > > 
> > > > > Practical example:
> > > > > 
> > > > >   ~$ LL_FS_RW=/ LL_FS_RO=/home sandboxer touch a
> > > > >   Executing the sandboxed command...
> > > > >   ~$ ls -l a
> > > > >   -rw-r--r-- 1 vt vt 0 Apr  1 15:53 a
> > > > 
> > > > Because there may have several ways to reach a file (e.g. hard links,
> > > > bind mounts), it would be difficult to get, remember, and track all the
> > > > related parent file hierarchies.
> > > > 
> > > > Landlock ties (ephemeral) permissions to inodes, which means that one
> > > > inode with enough rights in the file hierarchy is enough to grant access
> > > > for such rights to the files beneath it.  This is checked when accessing
> > > > a file, which makes security policies light and flexible (e.g. handles
> > > > file renaming, linking, and bind mounting).
> > > > 
> > > > In your example, / grants read-write access to all files beneath it, and
> > > > /home grants read access to all files beneath it.  When user space
> > > > request to write to /home/foo, / grants write permission.
> > > > 
> > > > This configuration is then valid, and it makes sure that the security
> > > > policy doesn't break user space because of unknown directories nesting
> > > > (e.g. setting different access rights on $HOME and $TMPDIR, for which
> > > > developers don't have a way to know which one is beneath the other).
> > > > 
> > > > For your use case, you'd need to have different file hierarchies and tie
> > > > them with specific permissions.  For instance, you could have /usr,
> > > > /var/tmp/pkg/postinst, /tmp, /etc .  Keep in mind that you can also
> > > > create nested sandboxes or run different stages of the package
> > > > installation in dedicated sandboxes (e.g. one for the install step with
> > > > access to /usr in read-write, another for the post installation with
> > > > access to /var/tmp/pkg/postinst in read-write and /usr in read).
> > > > 
> > > > Nicolas is working on a complementary way that would ease sandboxing for
> > > > some use cases: https://github.com/landlock-lsm/linux/issues/28
> > > > This will help users to quickly sandbox their application instances but
> > > > application developers should already be able to implement a more secure
> > > > deny-by-default policy without this feature.
> > > 
> > > Thanks for the answer.
> > > 
> > > Looks like it's currently impossible to create more restricted hierarchy
> > > inside of less restricted. I think this isn't consequence of 'deny by
> > > default' approach but sort of additivity of allowed permissions.
> > > Positive permissions of wider hierarchy will be added to more
> > > restrictive sub-hierarchy and supersede them.
> > 
> > Correct for the same ruleset.
> > 
> > All rules in the same ruleset are ORed whatever their file hierarchy,
> > but nested sandboxes (i.e. sequential calls to landlock_restrict_self())
> > can only add more restrictions in relation to their parent sandboxes.
> > 
> > > 
> > > To add more detail, what I tried to achieve: rpmbuild installs into so
> > > called 'buildroot', which is (for ALT) '/usr/src/tmp/name-buildroot'
> > > directory inside of '/usr/src/tmp' TMPDIR (and '/usr/src' is a HONE). When
> > > %check section is performed some scripts may inadvertently modify
> > > buildroot content which I thought to block. But because TMPDIR should be
> > > unrestricted (and / and HOME are not need to be restricted) it is not
> > > possible by any means to restrict buildroot.
> > 
> > The issue is that tmp is nested in src (and of course everything is
> > nested in /).  What about using different file hierarchies like this:
> > * /usr/pkg/src
> > * /usr/pkg/tmp
> > * /usr/pkg/root (which would be a bind mount of /, if this is really
> >   needed)
> 
> This will require redesign of existing build setup (which is time-
> proven) instead of just applying Landlock layer over existing.

Indeed, it has a cost.

> 
> I think Landlock flexibility would greatly benefit if it will allow to
> set mode where it do not OR other rules from the ruleset into a rule.
> 
> Rationale: If user will need other rules OR'ed (like the current behavior)
> she could just OR allowed_access from other rules when setting the rule.
> So with this addition old behavior is still reproducible.
> Without this addition (currently) the behavior we talking about (more
> restrictive hierarchy inside of less restrictive) is just not possible
> by design.
> 
> To implement this (from my theoretical point of view) only OR'ing
> part needs to be skipped (when applying rules) based on some flag
> (new rule_type or flags field from landlock_add_rule could be used).

The ORing part would indeed be one solution.  Another solution would be
to have a denied_access field as explained in the related issue:
https://github.com/landlock-lsm/linux/issues/28
Anyway, we also need to deal with multiple rules on the same inode/path
(not only the file hierarchy): either OR them or error out.

> 
> > 
> > I'm wondering why buildroot needs access to / though.  Could we identify
> > which resources it really needs?
> 
> To run executables, libraries, access /tmp (yes, in addition to TMPDIR,
> because we cannot dictate upstreams what tmp to use), /usr/lib, etc
> whatever normal system need to run anything. Build and test processes
> are usually just do anything. And we don't need protecting / because
> it's already protected enough with DAC.
> 
> R/O overlay (such as bind mount) Simon's idea require some root
> capabilities (setuip, user namespaces) which secure build env just don't
> have (by design). In that context self-restriction mechanisms like
> seccomp and Landlock looked attractive.

OK

> 
> > 
> > > 
> > > It is not possible, for example, to permit R/W to all existing entities
> > > of TMPDIR excluding 'name-buildroot', because in that case TMPDIR itself
> > > should have R/O permissions (it's needed to not supersede
> > > name-buildroot) and this will defy TMPDIR purpose.
> > 
> > What about creating dedicated directories beneath TMPDIR?
> 
> We cannot restrict TMPDIR because upstream scripts (as in "anything")
> may use it as a normal TMPDIR to store anything. That aforementioned
> idea of using `/usr/pkg/tmp` as a additional TMPDIR used solely for
> buildroot looked reasonable. But.
> 
> Thanks,
> 
> > 
> > > 
> > > That work of Nicolas looks promising for the goal I wanted to achieve
> > > and overall Landlock flexibility.
> > > 
> > > Thanks,
> > > 
> > > 
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > 
> > > 
> 
