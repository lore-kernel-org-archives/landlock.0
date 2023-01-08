Received: from saaz.rutschle.net (saaz.rutschle.net [51.15.243.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DE323A9
	for <landlock@lists.linux.dev>; Sun,  8 Jan 2023 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=rutschle.net; s=20170610; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e/E6OKUKw4VrJMzmKyFqBZy+YFxJcr8EFmEHoIUKwWk=; b=sDbzvq4wPkOerPTYOjvVkNsJqq
	Rp1z1hwQP/XkoR0qGaCQ4HKWMyjkr4BvuJhOGFbaElzCLtuxeuWO/4mwfaJsn72n97hUuXBeVDqs0
	D8pQ7GFEJ2YGcE97gWQOmwFa6KXsCr1XtqU5jbNZDms8F1EiuXsXh2WhdOa9Cg1+xFjw=;
Received: from yves by saaz.rutschle.net with local (Exim 4.92)
	(envelope-from <yves@rutschle.net>)
	id 1pEXbc-0005I2-1L; Sun, 08 Jan 2023 15:29:04 +0000
Date: Sun, 8 Jan 2023 15:29:04 +0000
From: Yves Rutschle <landlock@rutschle.net>
To: =?iso-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Yves Rutschle <landlock@rutschle.net>, landlock@lists.linux.dev
Subject: Re: Landlock setup
Message-ID: <20230108152903.GJ15625@rutschle.net>
Mail-Followup-To: =?iso-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Yves Rutschle <landlock@rutschle.net>, landlock@lists.linux.dev
References: <20221107172216.GA10688@rutschle.net>
 <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
 <20221108112722.GB10688@rutschle.net>
 <f0b57f51-e7c8-41f6-28eb-5dcb11686cc2@digikod.net>
 <20221108171518.GC10688@rutschle.net>
 <fd1007af-0ddf-1fe9-0c5d-e52eec412426@digikod.net>
 <20221216095324.GO15113@rutschle.net>
 <05321f12-4559-9c79-a35c-8b3b663545b3@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05321f12-4559-9c79-a35c-8b3b663545b3@digikod.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Dec 16, 2022 at 11:34:58AM +0100, Mickaël Salaün wrote:
> You can get any Linux's mainline landlock.h [1] [...]

My problem was that I copied the syscall numbers directly
into landlock.h (I didn't want to import too many headers)
and got it wrong, so it would call system calls that didn't
exist.

The example works, I now "just" have to do the work :-)

Y.

