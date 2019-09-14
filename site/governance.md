<!-- ((! set title Governance of the OCaml.org domain !)) -->

# Governance of the OCaml.org domain
*Table of contents*

## Overview and Scope

As the OCaml community continues to grow, more collaborative work is being
undertaken to support and extend the needs of the language and
its users. This document focuses specifically on the
OCaml.org *domain name* and the Projects that make use of that domain name.
It describes the reporting structure, roles involved and the responsibilities.
The aim is to avoid introducing cumbersome processes while still providing a
high degree of transparency.

### Purpose - a document that represents reality

At any given time, this document must reflect the *current reality*.
It is *not* intended to be aspirational nor reflect the kind of structures
that people may expect to see. This is an important point because the utility
of this document is limited to the extent that it represents how things
*really* are, as opposed to how people may *desire* them to be in the future.
As the environment changes, this document should also be updated such that it
consistently reflects how things are.

### Disambiguation - the meaning of OCaml.org

When using the term 'OCaml.org', there is the potential for a number of
different interpretations.  To reduce confusion, these are described below and
the meaning of the term *for this document* is explained.

*Second-level domain name* - This is the domain name we are familiar with,
'OCaml.org', which has associated sub-domains and records (NB: Just for
clarity and edification, the top-level domain here is '.org').

*Community website* - This is the community facing website, which can be found
at [ocaml.org](//ocaml.org) and is often referred to as simply 'OCaml.org'.

*Infrastructure* - This may refer to the virtual machines (VMs), services or
other things that are somehow routed via the second-level domain name itself.
An obvious example is the VM that hosts the community website but another would
be the VMs and systems that host the tarballs and files used by the OPAM
package manager tool.

For the purposes of this document, we take the first meaning — that
this document relates to the governance of the second-level domain,
'OCaml.org'. Therefore, anything that involves use of the domain name in some
form is affected by the governance of the domain name itself. That includes
any public facing webpages, URLs and other resources.
This is important because, in a way, OCaml.org is the sum of the Projects
it hosts.

To avoid confusion between the domain name itself and the community website
Project, the term 'OCaml.org' in this document refers *only* to
the second-level domain name itself. Any references to the domain of the
community website project will include the sub-domain 'www.ocaml.org',
even though this is set to redirect to [ocaml.org](//ocaml.org).

### Guiding principles of OCaml.org

There are certain guiding principles for OCaml.org, which include openness and
a community-focus, that Projects need to be compatible with. These principles
extend to all of the Projects that use the domain OCaml.org.


## Roles

### Owner and Delegates

The Owner of OCaml.org is Xavier Leroy, the lead developer of the OCaml
language. Projects under OCaml.org sub-domains are managed by the
community, meaning that it is the community that actively contributes to the
day-to-day maintenance of any OCaml.org Project, but the general strategic
direction is drawn by the Owner.

It is the role of the Owner to resolve disputes that may arise
in relation to OCaml.org itself, specifically to ensure that the Projects under
OCaml.org are able to progress in a coordinated way.
It is the community's role to guide the decisions of the Owner
through active engagement, contributions and discussions.  To foster a healthy
and growing community, the Owner will make the
goals and decisions clear and public.

It is anticipated that the Projects themselves will be self-managing and will
resolve issues within their communities, without recourse to the Owner.
Where the Owner needs to become involved, he/she will act as arbitrator.

#### Delegates

The Owner may choose to delegate authority to others to manage the domain and
act in the Owner's name, though ownership remains with the Owner.
Those Delegates are free to choose how they arrange themselves, in agreement
with the Owner. In the specific case of disputes, the Delegate(s) will consult
with the Owner, who will act as arbitrator if required.

*Currently, Xavier Leroy has delegated responsibility for OCaml.org to
Anil Madhavapeddy, who has accepted this Role.*

### Maintainers

Projects under OCaml.org will have their own Maintainers, who have commit
access to relevant repositories and are responsible for:
- Managing the specific project.
- Writing code directly to repositories.
- Eliciting and screening the contributions of others.
- Ensuring that the Owners/Delegates are aware of community needs.

Generally, Maintainers only have authority over the specific Projects they are
responsible for though it is expected that Maintainers of different Projects
will collaborate frequently, especially in the case of major changes or
announcements.  Typically, individuals who have made substantive contributions
to a Project will be invited to become Maintainers.

### Contributors

Contributors are wider members of the OCaml community who make valuable
contributions, but generally do not have authority to make direct changes to a
Project's code-base or documentation. Anyone can become a Contributor and there
is no expectation of commitment, no specific skill requirement and no
selection process. The only necessary step is to make or suggest some
improvement or change to the Project.

Contributors can interact with a Project via tools such as email lists, issue
trackers and wiki pages, for example.  The main email list for OCaml.org is
infrastructure@lists.ocaml.org and is open to all. Maintainers are
free to direct discussion to their own dedicated mailing lists, as they feel
appropriate. Those whose contributions become part of a public git repository
will be recognised in some form on a public website as thanks.

It is expected that regular Contributors to specific Projects may be asked if
they wish to become Maintainers, as described above. There is no obligation to
accept such an offer.

### Users

Users are the most important group and it includes the much wider community of
anyone who interacts with OCaml.org in any way.  This covers all web-visitors,
package users, and members of mailing lists. Without Users, the Projects serve
no purpose so the impact of any major decisions on this group should be
assessed.

Wherever practicable, Users should be encouraged to provide feedback and
participate in the Projects as much as possible. Users who engage a lot with a
Project will likely go on to become Contributors. 

It should be noted that these Roles are not mutually exclusive, for example
Maintainers and Contributors are necessarily also Users. 

## Projects

**Definition** - A Project within OCaml.org is characterised by its sub-domain.
It is expected that the majority of new work will fall under an existing
sub-domain and will therefore already have a set of Maintainers and
Contributors (as described above).

**Communication** - All Maintainers of Projects must join the Infrastructure
mailing list (infrastructure@lists.ocaml.org). This list is the primary way
that information and decisions surrounding OCaml.org will be discussed and
disseminated. If Projects wish to set up their own lists, they may do so on
lists.ocaml.org (see below).

**Governance** - Projects are free to choose their mode of governance provided
it is compatible with the governance and guiding principles of OCaml.org.


### Initiating a Project 

Any proposal for new work should be raised and discussed on the Infrastructure
mailing list. If there is consensus among Maintainers that the work fits
within an existing Project, then the Maintainers of that Project can take it
forward. 

If a new sub-domain is required, then a brief proposal
should be made on the Infrastructure list that covers:

- The aims and purpose of the Project (inc name of the sub-domain required).
- Specific resources required and for how long (e.g VMs).
- Any impact on or relation to existing Projects.
- Information about the initial Maintainers.
- Details of proposed licensing arrangements for code/content.

The above information is intended to stimulate discussion so brevity is
preferred. Following discussion, and if the Owner/Delegate agrees, the
resources can be provisioned. There is no obligation for the Owner/Delegate to
provide any resources beyond the sub-domain.

### Closing a Project

A Project can be closed:

- If it has completed its aims and the Maintainers request it be closed down.
- If there are no Maintainers left to continue supporting it and no-one willing
to take on the role.
- By the Owner/Delegate for any reason.

In all cases, prior notice must be sent to the Infrastructure list including a
reasonable time-frame and reasons for closure.
Closure simply implies revocation or redirection of the sub-domain and/or
shutting down or reclaiming any resources provided (e.g VMs). 


## Processes

### Decision Making and Communication

The preferred approach for most discussions is through
[rough consensus and running code](http://en.wikipedia.org/wiki/Rough_consensus).
Discussions should be public and take place on either the Infrastructure
mailing list, the relevant Project mailing-list or on relevant issue trackers.
Users and Contributors are encouraged to take part and voice their opinions.
Typically, the Maintainers of a Project will make the final decision, having
accounted for wider views.

All Projects under OCaml.org are to be documented such that Users can find out
about them and understand both the purpose and how they can contribute.


### Contribution Process and Licensing

Contributions to OCaml.org will primarily be to one or more of its Projects.
Each Project under OCaml.org needs to define a clear contribution process and
licensing agreement so
that Contributors understand how to engage with the Maintainers. Typically,
this will cover where communication occurs and the process for submitting
patches. Contributions from the community are encouraged and can take many
forms including, bug fixes, new features, content or documentation.  

All Projects under OCaml.org are expected to be open-source and the licensing
arrangements should reflect this.

Contributions to OCaml.org itself may be in the form of resources that can be
shared by Projects and can be discussed with Owner/Delegate and Project
Maintainers on the Infrastructure mailing list.

### Dispute resolution

Maintainers are expected to make decisions regarding their Projects.
The intent is for any Maintainers to resolve disagreements, through
a consensus process within each Project.  

On the rare occasions, where Maintainers of a Project cannot agree
on a way forward the following approach is suggested:

- The specific issue(s) will need to be articulated so it is clear what needs
to be discussed.
- Other Maintainers of OCaml.org projects will be asked for their views.
- If the discussion still cannot be resolved, the Owner (or their Delegate)
will act as arbitrator.

During the above, it is expected that all people will be reasonable and be
respectful of each other's efforts and viewpoints.  In general, we expect to
generate consensus among the community to resolve conflicts.  

## Existing Projects

Projects are referred to by their **sub-domain** and summaries of the
current Projects are maintained on the Infrastructure
wiki page: <https://github.com/ocaml/infrastructure/wiki>

****

**Adoption of this document**

This version of the document was agreed upon by the incumbent set
of Maintainers in September 2015. You can look back at the
[discussion](http://lists.ocaml.org/pipermail/infrastructure/2015-August/000518.html)
or see the [related issue](https://github.com/ocaml/ocaml.org/issues/700).

***Version 1.0.0 — September 2015***
<!--
The version number should be changed for *any* edits that are made to this
document, even typos. Otherwise disambiguating between versions is awkward. 

Best wishes,
Amir

Sep 2015
-->
