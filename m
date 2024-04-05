Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C22C16F27B
	for <landlock@lists.linux.dev>; Fri,  5 Apr 2024 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712333060; cv=none; b=bpUaH9ngEdIi/rgnI8b5V0ycxtde0lNel1YEdT/9dOz7dvMOKQhyaZyyrr7gtu3hJoEpKq9hqoAhSp3ynB/+vVw3vAd/4uFNMGUD04pjwCcVzzCJdkY6kV7z5QK0wnqdI324W5AI9XxRv5Mga+KPtLxWpZ+LCibP9mXEDebffWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712333060; c=relaxed/simple;
	bh=I2Jyngl/nWT1xXAVjgccPZt04ZA16EmB/l6UuAP3Coo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqR4Vv9NZ1wMDP4Lfb6I9YB+NHJQBKjeL6T99XFkWWReEGjwmaLuBTI1uX81kWVaK1qvSpRnfaIidB1gOA3bRTZDmEL5w9xjko/3qLBRjNbAGF7ZJGnM605L3OMFGBueQlOx/vE2hvXAYWONJ7HPqPA2onk/+YiZYiPQcRbwLvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id B15BB72C8CC;
	Fri,  5 Apr 2024 19:04:09 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id AA71F36D0160;
	Fri,  5 Apr 2024 19:04:09 +0300 (MSK)
Date: Fri, 5 Apr 2024 19:04:09 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: landlock@lists.linux.dev
Subject: Re: R/O protection for lower level dirs
Message-ID: <20240405160409.is4wrceb6dyivujf@altlinux.org>
References: <20240401160614.32py2wrijdp5yots@altlinux.org>
 <20240402.quaQuieyohd9@digikod.net>
 <20240403152043.fc5gpqu2ghlahyyj@altlinux.org>
 <20240403.Taip4yae2ohn@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240403.Taip4yae2ohn@digikod.net>

Mickaël, Simon,

On Wed, Apr 03, 2024 at 06:57:06PM +0200, Mickaël Salaün wrote:
> On Wed, Apr 03, 2024 at 06:20:43PM +0300, Vitaly Chikunov wrote:
> > On Tue, Apr 02, 2024 at 11:11:39AM +0200, Mickaël Salaün wrote:
> > > On Mon, Apr 01, 2024 at 07:06:14PM +0300, Vitaly Chikunov wrote:
> > > > 
> > > > I want to ensure that some deeper directory is write protected (as a non
> > > > security measure but so that some post-install processing do not
> > > > accidentally touch installed files).  Is there a way to achieve this
> > > > with Landlock?
> > > 
> > > Landlock follows a deny-by-default policy, which is a good practice for
> > > access control.  In your example, you'll need to identify the set of
> > > file hierarchies that should be legitimately allowed, and set the
> > > appropriate access rights on them, not the other way around.
> > > 
> > > > 
> > > > For example, if we do R/W access to / (root tree is already protected
> > > > enough with DAC) and then R/O access to /home we still get full R/W access
> > > > everywhere and /home seems not restricted. Also, Landlock does not warn for
> > > > such configuration, silently accepting it as valid.
> > > > 
> > > > Practical example:
> > > > 
> > > >   ~$ LL_FS_RW=/ LL_FS_RO=/home sandboxer touch a
> > > >   Executing the sandboxed command...
> > > >   ~$ ls -l a
> > > >   -rw-r--r-- 1 vt vt 0 Apr  1 15:53 a
> > > 
> > > Because there may have several ways to reach a file (e.g. hard links,
> > > bind mounts), it would be difficult to get, remember, and track all the
> > > related parent file hierarchies.
> > > 
> > > Landlock ties (ephemeral) permissions to inodes, which means that one
> > > inode with enough rights in the file hierarchy is enough to grant access
> > > for such rights to the files beneath it.  This is checked when accessing
> > > a file, which makes security policies light and flexible (e.g. handles
> > > file renaming, linking, and bind mounting).
> > > 
> > > In your example, / grants read-write access to all files beneath it, and
> > > /home grants read access to all files beneath it.  When user space
> > > request to write to /home/foo, / grants write permission.
> > > 
> > > This configuration is then valid, and it makes sure that the security
> > > policy doesn't break user space because of unknown directories nesting
> > > (e.g. setting different access rights on $HOME and $TMPDIR, for which
> > > developers don't have a way to know which one is beneath the other).
> > > 
> > > For your use case, you'd need to have different file hierarchies and tie
> > > them with specific permissions.  For instance, you could have /usr,
> > > /var/tmp/pkg/postinst, /tmp, /etc .  Keep in mind that you can also
> > > create nested sandboxes or run different stages of the package
> > > installation in dedicated sandboxes (e.g. one for the install step with
> > > access to /usr in read-write, another for the post installation with
> > > access to /var/tmp/pkg/postinst in read-write and /usr in read).
> > > 
> > > Nicolas is working on a complementary way that would ease sandboxing for
> > > some use cases: https://github.com/landlock-lsm/linux/issues/28
> > > This will help users to quickly sandbox their application instances but
> > > application developers should already be able to implement a more secure
> > > deny-by-default policy without this feature.
> > 
> > Thanks for the answer.
> > 
> > Looks like it's currently impossible to create more restricted hierarchy
> > inside of less restricted. I think this isn't consequence of 'deny by
> > default' approach but sort of additivity of allowed permissions.
> > Positive permissions of wider hierarchy will be added to more
> > restrictive sub-hierarchy and supersede them.
> 
> Correct for the same ruleset.
> 
> All rules in the same ruleset are ORed whatever their file hierarchy,
> but nested sandboxes (i.e. sequential calls to landlock_restrict_self())
> can only add more restrictions in relation to their parent sandboxes.
> 
> > 
> > To add more detail, what I tried to achieve: rpmbuild installs into so
> > called 'buildroot', which is (for ALT) '/usr/src/tmp/name-buildroot'
> > directory inside of '/usr/src/tmp' TMPDIR (and '/usr/src' is a HONE). When
> > %check section is performed some scripts may inadvertently modify
> > buildroot content which I thought to block. But because TMPDIR should be
> > unrestricted (and / and HOME are not need to be restricted) it is not
> > possible by any means to restrict buildroot.
> 
> The issue is that tmp is nested in src (and of course everything is
> nested in /).  What about using different file hierarchies like this:
> * /usr/pkg/src
> * /usr/pkg/tmp
> * /usr/pkg/root (which would be a bind mount of /, if this is really
>   needed)

This will require redesign of existing build setup (which is time-
proven) instead of just applying Landlock layer over existing.

I think Landlock flexibility would greatly benefit if it will allow to
set mode where it do not OR other rules from the ruleset into a rule.

Rationale: If user will need other rules OR'ed (like the current behavior)
she could just OR allowed_access from other rules when setting the rule.
So with this addition old behavior is still reproducible.
Without this addition (currently) the behavior we talking about (more
restrictive hierarchy inside of less restrictive) is just not possible
by design.

To implement this (from my theoretical point of view) only OR'ing
part needs to be skipped (when applying rules) based on some flag
(new rule_type or flags field from landlock_add_rule could be used).

> 
> I'm wondering why buildroot needs access to / though.  Could we identify
> which resources it really needs?

To run executables, libraries, access /tmp (yes, in addition to TMPDIR,
because we cannot dictate upstreams what tmp to use), /usr/lib, etc
whatever normal system need to run anything. Build and test processes
are usually just do anything. And we don't need protecting / because
it's already protected enough with DAC.

R/O overlay (such as bind mount) Simon's idea require some root
capabilities (setuip, user namespaces) which secure build env just don't
have (by design). In that context self-restriction mechanisms like
seccomp and Landlock looked attractive.

> 
> > 
> > It is not possible, for example, to permit R/W to all existing entities
> > of TMPDIR excluding 'name-buildroot', because in that case TMPDIR itself
> > should have R/O permissions (it's needed to not supersede
> > name-buildroot) and this will defy TMPDIR purpose.
> 
> What about creating dedicated directories beneath TMPDIR?

We cannot restrict TMPDIR because upstream scripts (as in "anything")
may use it as a normal TMPDIR to store anything. That aforementioned
idea of using `/usr/pkg/tmp` as a additional TMPDIR used solely for
buildroot looked reasonable. But.

Thanks,

> 
> > 
> > That work of Nicolas looks promising for the goal I wanted to achieve
> > and overall Landlock flexibility.
> > 
> > Thanks,
> > 
> > 
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > 
