Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27121D505
	for <landlock@lists.linux.dev>; Tue, 21 Mar 2023 18:54:29 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Ph0DG2scGzMrCRT;
	Tue, 21 Mar 2023 19:16:30 +0100 (CET)
Received: from unknown by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Ph0DF4m7rzMsmJw;
	Tue, 21 Mar 2023 19:16:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1679422590;
	bh=SExsR16XCgyMAqbuSM0sJKtdFLVWin9yFJ9p3JYsOHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tuoeucrs9/7efetPKzQOxTlNAcxWW2zlLLZq7yXWFV9ZNXlwK9GIFeovz3Zn+ue5p
	 9IuabRhYKIUiihW7d+zgv8Wr3ZIEwk9mokwDW8+64AME9y9a6tvvP2mtTINzYic0R5
	 SOqBxYNAF06bdGBk3AXdJnaULshdKs8j04zP6CpM=
Message-ID: <42ffeef4-e71f-dd2b-6332-c805d1db2e3f@digikod.net>
Date: Tue, 21 Mar 2023 19:16:28 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: Does Landlock not work with eCryptfs?
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>
Cc: =?UTF-8?Q?G=c3=bcnther_Noack?= <gnoack3000@gmail.com>,
 landlock@lists.linux.dev, Tyler Hicks <code@tyhicks.com>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
References: <20230319.2139b35f996f@gnoack.org>
 <c1c9c688-c64d-adf2-cc96-dc2aaaae5944@digikod.net>
 <20230320.c6b83047622f@gnoack.org>
 <5d415985-d6ac-2312-3475-9d117f3be30f@digikod.net>
 <e70f7926-21b6-fbce-c5d6-7b3899555535@digikod.net>
 <20230321172450.crwyhiulcal6jvvk@wittgenstein>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20230321172450.crwyhiulcal6jvvk@wittgenstein>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 21/03/2023 18:24, Christian Brauner wrote:
> On Tue, Mar 21, 2023 at 05:36:19PM +0100, Mickaël Salaün wrote:
>> There is an inconsistency between ecryptfs_dir_open() and ecryptfs_open().
>> ecryptfs_dir_open() actually checks access right to the lower directory,
>> which is why landlocked processes may not access the upper directory when
>> reading its content. ecryptfs_open() uses a cache for upper files (which
>> could be a problem on its own). The execution flow is:
>>
>> ecryptfs_open() -> ecryptfs_get_lower_file() -> ecryptfs_init_lower_file()
>> -> ecryptfs_privileged_open()
>>
>> In ecryptfs_privileged_open(), the dentry_open() call failed if access to
>> the lower file is not allowed by Landlock (or other access-control systems).
>> Then wait_for_completion(&req.done) waits for a kernel's thread executing
>> ecryptfs_threadfn(), which uses the kernel's credential to access the lower
>> file.
>>
>> I think there are two main solutions to fix this consistency issue:
>> - store the mounter credentials and uses them instead of the kernel's
>> credentials for lower file and directory access checks (ecryptfs_dir_open
>> and ecryptfs_threadfn changes);
>> - use the kernel's credentials for all lower file/dir access check,
>> especially in ecryptfs_dir_open().
>>
>> I think using the mounter credentials makes more sense, is much safer, and
>> fits with overlayfs. It may not work in cases where the mounter doesn't have
>> access to the lower file hierarchy though.
>>
>> File creation calls vfs_*() helpers (lower directory) and there is not path
>> nor file security hook calls for those, so it works unconditionally.
>>
>>  From Landlock end users point of view, it makes more sense to grants access
>> to a file hierarchy (where access is already allowed) and be allowed to
>> access this file hierarchy, whatever it belongs to a specific filesystem
>> (and whatever the potential lower file hierarchy, which may be unknown to
>> users). This is how it works for overlayfs and I'd like to have the same
>> behavior for ecryptfs.
> 
> So given that ecryptfs is marked as "Odd Fixes" who is realistically
> going to do the work of switching it to a mounter's credentials model,
> making sure this doesn't regress anything, and dealing with any
> potential bugs caused by this. It might be potentially better to just
> refuse to combine Landlock with ecryptfs if that's possible.

If Tyler is OK with the proposed solutions, I'll get a closer look at it 
in a few months. If anyone is interested to work on that, I'd be happy 
to review and test (the Landlock part).
