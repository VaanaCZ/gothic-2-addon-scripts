// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hagen_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Hagen_EXIT_Condition;
	information	= DIA_Hagen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hagen_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Hagen_PMSchulden (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Hagen_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Hagen_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hagen_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Vous avez bien fait de venir. Comme ça vous allez pouvoir payer votre amende sans attendre.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Vous ne prenez guère les lois de la ville au sérieux, n'est-ce pas ?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //La liste de vos infractions ne cesse de s'allonger.
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //Et n'allez surtout pas me dire que vous n'étiez pas au courant !
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Vous allez payer l'amende maximale.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //Il semblerait que la situation ait évolué...
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Il n'y a plus de témoins du meurtre que vous avez commis !
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Plus personne ne vous accuse de vol !
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //Il n'y a plus de témoins concernant la rixe à laquelle vous avez pris part.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Toutes les accusations vous concernant ont été retirées.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //J'ignore ce qui s'est passé et je ne tiens pas à le savoir.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Faites juste en sorte de ne plus vous attirer d'ennuis ici.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //Quoi qu'il en soit, j'ai décidé d'annuler vos dettes.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Veillez juste à ne plus avoir d'ennuis.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Vous devrez néanmoins vous acquitter de la totalité de vos amendes.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Alors, vous êtes disposé à payer ?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Je n'ai pas assez d'or.",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"C'est combien déjà ?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Je veux payer l'amende !",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Combien c'était déjà ?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Je n'ai pas assez d'or.",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"C'est combien déjà ?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"Je veux payer l'amende !",DIA_Hagen_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Hagen_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Hagen_PETZMASTER   (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Hagen_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_PETZMASTER_Info()
{
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Votre réputation vous a précédé. Vous avez enfreint les lois de la ville.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Vous vous êtes mis dans un beau pétrin.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //Le meurtre est un crime sérieux !
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Sans même parler de vos autres infractions...
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Les gardes ont ordre d'exécuter tous les meurtriers sur-le-champ.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //Le meurtre n'est pas acceptable dans cette ville, mais vous pouvez montrer votre remords en payant l'amende.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Vous êtes accusé de vol !
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Sans même parler de ce que j'ai entendu d'autre à votre sujet...
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //Vous avez enfreint les lois de la ville et je vais devoir vous mettre une amende.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Vous avez pris part à une rixe, ce qui est contraire aux lois de la ville.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //Et qu'est-ce que c'est que cette histoire de moutons ?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Toute infraction aux lois de la ville va également à l'encontre des règles édictées par Innos.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Vous allez donc devoir payer.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Vous vous en êtes pris à nos moutons, même si j'ai eu beaucoup de mal à le croire.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Pourquoi dois-je me charger de telles futilités ?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Vous allez devoir payer une compensation !
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Combien ?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"Je n'ai pas assez d'or.",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Je veux payer l'amende !",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Je veux payer l'amende !
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //Bien. Je veillerai à ce que tout le monde l'apprenne. Cela devrait quelque peu redorer votre blason.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //Je n'ai pas assez d'argent.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Alors faites en sorte de trouver de l'or le plus vite possible.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //Je vous avertis : si vous aggravez votre cas, cela va aller mal pour vous !
	
	Hagen_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Hallo (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Hallo_Condition;
	information	 = 	DIA_Lord_Hagen_Hallo_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};
func int DIA_Lord_Hagen_Hallo_Condition ()
{	
	if (hero.guild != GIL_NONE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //J'ai entendu parler de vous.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar m'a dit que vous souhaitiez me parler.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Vous êtes l'étranger qui s'intéresse à l'Œil d'Innos.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Je suis le seigneur Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Paladin du roi, guerrier de notre seigneur Innos et commandant en chef de Khorinis.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //J'ai fort à faire alors ne me faites pas perdre mon temps. Dites-moi ce qui vous amène.
};

///////////////////////////////////////////////////////////////////////
//	Info Frieden
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Frieden (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Frieden_Condition;
	information	 = 	DIA_Lord_Hagen_Frieden_Info;
	permanent	 = 	FALSE;
	description	 =  "J'apporte une proposition de paix des mercenaires !";
};
func int DIA_Lord_Hagen_Frieden_Condition ()
{	
	if (MIS_Lee_Friedensangebot == LOG_RUNNING)
	&& (Npc_HasItems (other, itwr_Passage_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Frieden_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //Je vous apporte une proposition de paix de la part des mercenaires.
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //(bougon) Hmm... montrez-moi ça.
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Je connais le général Lee et je suis au courant des circonstances de sa condamnation aux travaux forcés dans la colonie.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Je le considère comme un homme honorable, aussi suis-je prêt à lui accorder l'absolution... mais à lui, et à lui seul !
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //Cela ne s'applique nullement à ses hommes, la plupart d'entre eux étant de misérables coupe-jarrets ayant mille fois mérité le châtiment qui les attend.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Eux, il est hors de question que je leur pardonne. Vous pouvez rapporter ma réponse au général Lee.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //C'est tout ?
	};
	B_LogEntry (Topic_Frieden,"Le seigneur Hagen veut bien accorder son pardon à Lee mais pas aux autres mercenaires."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Armee
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Armee (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Armee_Condition;
	information	 = 	DIA_Lord_Hagen_Armee_Info;
	permanent	 = 	FALSE;
	description	 =  "Les hordes du mal se rassemblent très près d'ici. Dans la Vallée des mines.";
};
func int DIA_Lord_Hagen_Armee_Condition ()
{	
	if (!MIS_Lee_Friedensangebot == LOG_RUNNING)
	|| (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Armee_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //L'armée des ténèbres se rassemble tous près d'ici, dans la Vallée des mines.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //La Vallée des mines ? Nous y avons envoyé une expédition et nous sommes au courant que le col est tenu par les orques.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Mais jusque-là, personne ne m'a encore parlé d'une quelconque armée des ténèbres.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //S'agit-il d'une ruse destinée à me faire croire qu'il est nécessaire de nous allier avec les mercenaires ?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //Non.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //(sceptique) Et de quelle armée s'agirait-il ?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //De celle constituée par plusieurs dragons qui ont réuni de nombreuses créatures malfaisantes sous leurs ordres.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Des dragons ? S'il faut en croire les anciens écrits, cela fait des siècles que plus personne n'en a vu.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Dites-moi... pourquoi devrais-je accorder foi à vos dires ?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //La question n'est pas de savoir si vous devez me croire ou non, mais si vous pouvez vous permettre de NE PAS me croire.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Tant que je n'aurai pas de preuve, je ne pourrai pas envoyer d'autres hommes là-bas.
};

///////////////////////////////////////////////////////////////////////
//	Info Proof
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Proof (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Proof_Condition;
	information	 = 	DIA_Lord_Hagen_Proof_Info;
	permanent	 = 	TRUE;
	description	 =  "Vous voulez donc que je vous apporte une preuve ?";
};
func int DIA_Lord_Hagen_Proof_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee )
	&& (Hagen_BringProof == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Proof_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //Vous voulez donc que je vous apporte la preuve de ce que j'avance ?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Précisément. Franchissez le col pour atteindre la Vallée des mines. Une fois là-bas, retrouvez notre expédition et parlez au commandant Garond.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Si quelqu'un est au courant de la situation dans les environs, c'est bien lui.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Si jamais il confirme vos dires, mon aide vous est acquise.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Cela signifie-t-il que vous me remettrez l'Œil d'Innos ?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //L'Œil d'Innos ? Très bien. Prouvez-moi ce que vous avancez et je veillerai à ce que vous ayez le droit de porter l'amulette.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //Puis-je considérer que j'ai votre parole ?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Oui, car tel est le cas.
		Hagen_BringProof = TRUE;
	}
	else
	{
		if (hero.guild == GIL_NOV)
		{
			PrintScreen	(PRINT_Addon_GuildNeeded_NOV, -1,-1, FONT_Screen ,2);
		}
		else 
		{	
			PrintScreen	(PRINT_Addon_GuildNeeded, -1,-1, FONT_Screen ,2);
		};	
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Auge (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Auge_Condition;
	information	 = 	DIA_Lord_Hagen_Auge_Info;
	permanent	 = 	FALSE;
	description	 =  "Que savez-vous au sujet de l'Œil d'Innos ?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //Que savez-vous au sujet de l'Œil d'Innos ?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //Il s'agit d'un artefact d'origine divine. (pensif) Dans les prophéties d'antan, on mentionne qu'il est lié aux dragons.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //Mais les écrits disent également que seul un Elu d'Innos peut le porter.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //Mais je suis un Elu d'Innos !
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Dans ce cas, peut-être pourrez-vous porter l'amulette.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Pass (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Pass_Condition;
	information	 = 	DIA_Lord_Hagen_Pass_Info;
	permanent	 = 	FALSE;
	description	 =  "Comment suis-je censé franchir le col ?";
};
func int DIA_Lord_Hagen_Pass_Condition ()
{	
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Pass_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Comment suis-je censé franchir le col ?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Je vais vous donner la clé de la porte, mais vous devrez vous débrouiller seul pour ce qui est de traverser les lignes orques.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Qu'Innos vous protège.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Le seigneur Hagen veut que je lui apporte la preuve de l'existence de l'armée du mal. Je vais me rendre dans la Vallée des mines afin d'aller en parler au commandant Garond.");
	
	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine (Fernando,"WAIT"); 
	};
	
	Wld_InsertNpc (BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47");	//Joly: //ADDON stört dann nicht mehr
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lord_Hagen_Ornament		(C_INFO)
{
	npc		 	= PAL_200_Hagen;
	nr		 	= 10;
	condition	= DIA_Addon_Lord_Hagen_Ornament_Condition;
	information	= DIA_Addon_Lord_Hagen_Ornament_Info;

	description	= "Je recherche un bijou métallique.";
};

func int DIA_Addon_Lord_Hagen_Ornament_Condition ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
	&& (Lord_Hagen_GotOrnament == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lord_Hagen_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Je cherche un ornement en métal. Il a dû se trouver à proximité  du cercle de pierre près de la ferme de Lobart.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Vous voulez parler de cette chose-là ? On a d'abord cru que cela pouvait être une rune magique mais il s'avère que c'est sans aucun intérêt.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //Vous pouvez le prendre si vous voulez. Je n'en ai pas l'utilité.
	
	CreateInvItems (self, ItMi_Ornament_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Ornament_Addon, 1);	
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Khorinis (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Khorinis_Condition;
	information	 = 	DIA_Lord_Hagen_Khorinis_Info;
	permanent	 = 	FALSE;
	description	 =  "Pourquoi êtes-vous venu à Khorinis ?";
};
func int DIA_Lord_Hagen_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //Que faites-vous à Khorinis ?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Nous sommes en mission pour le royaume. Nos ordres viennent directement du roi Rhobar.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //Je vous ai dit que nous avions envoyé une expédition à la Vallée des mines. Telle est la raison de notre présence ici.
};

///////////////////////////////////////////////////////////////////////
//	Info Minental
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Minental (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Minental_Condition;
	information	 = 	DIA_Lord_Hagen_Minental_Info;
	permanent	 = 	TRUE;
	description	 =  "Que font vos hommes dans la Vallée des mines ?";
};
func int DIA_Lord_Hagen_Minental_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Khorinis))
	&& (KnowsPaladins_Ore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Minental_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //Que font vos hommes dans la Vallée des mines ?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Je ne vois aucune raison de vous en parler.
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //C'est bien de là-bas que vous venez, non ? Alors, vous devriez le savoir...
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //D'accord. Je peux bien vous le dire, vu que de toute façon vous vous y rendez...
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //C'est en raison du minerai magique. Il peut décider de l'issue du conflit.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Si elle ne dispose pas de suffisamment d'armes forgées à partir du minerai magique, l'armée du roi n'aura pas la moindre chance contre les guerriers d'élite orques .
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //Et les mines de l'île sont les seules auxquelles nous ayons encore accès.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Une fois les soutes de notre navire remplies à ras bord, nous repartirons pour le continent.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //La guerre contre les orques se passe donc si mal que ça ?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //Je vous en ai déjà trop dit.
	};
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Hagen_CanTeach		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	5;
	condition	 = 	DIA_Hagen_CanTeach_Condition;
	information	 = 	DIA_Hagen_CanTeach_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Je cherche un maître d'arme.";
};
func int DIA_Hagen_CanTeach_Condition ()
{	
	if (LordHagen_Teach2H == FALSE)
	&& (other.guild == GIL_PAL)
	&& (other.aivar[REAL_TALENT_2H] >= 90)
	&& (other.aivar[REAL_TALENT_2H] < 100)
	{
		return TRUE;
	};
};
func void DIA_Hagen_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Je cherche un maître de l'épée.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //Vous en avez un devant vous.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Le seigneur Hagen peut m'enseigner le combat avec des armes à deux mains.");
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Hagen_Teach(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 100;
	condition	= DIA_Hagen_Teach_Condition;
	information	= DIA_Hagen_Teach_Info;
	permanent	= TRUE;
	description = "Commençons (apprendre le combat à l'arme à deux mains).";
};                       
//----------------------------------
var int DIA_Hagen_Teach_permanent;
//----------------------------------
FUNC INT DIA_Hagen_Teach_Condition()
{
	if (LordHagen_Teach2H == TRUE)
	&& (DIA_Hagen_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hagen_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //Dans ce cas, commençons.
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Vous êtes désormais devenu un maître de l'épée. Je n'ai plus rien à vous apprendre.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Puisse votre sagesse guider vos actes futurs.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Hagen_Teach);
};

FUNC VOID DIA_Hagen_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)) ,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)) ,DIA_Hagen_Teach_2H_5);	
};

FUNC VOID DIA_Hagen_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);	
	
};
//##############################################################
//###
//###	RitterAufnahme
//###
//##############################################################

//**************************************************************
//	Ich will auch ein Paladin werden.
//**************************************************************


INSTANCE DIA_Lord_Hagen_Knight		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	990;
	condition	 = 	DIA_Lord_Hagen_Knight_Condition;
	information	 = 	DIA_Lord_Hagen_Knight_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Je veux entrer au service de l'ordre.";
};
FUNC INT DIA_Lord_Hagen_Knight_Condition ()
{	
	if (hero.guild == GIL_MIL)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Knight_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Je souhaiterais intégrer l'ordre.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Bien. Vous avez fait la preuve que vous aviez le courage, les compétences et le savoir requis pour servir Innos.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Quant à vos actes, ce sont ceux d'un cœur pur.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Si tel est votre souhait, je me ferai une joie de vous accueillir au sein de notre ordre.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Je n'en suis pas encore très sûr.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Je suis prêt !",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Etre un guerrier d'Innos signifie se consacrer corps et âme à la cause de ce dernier.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //Seuls les combattants les plus nobles et les plus courageux sont acceptés au sein de notre ordre.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Si vous êtes décidé à devenir paladin, vous devez prouver que vous en êtes digne.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Je ne suis pas encore tout à fait sûr...
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Alors, partez et chassez le doute qui envahit votre cœur. Revenez quand vous serez prêt.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Je suis prêt.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //(sérieux) Alors qu'il en soit ainsi.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //(sérieux) Nombreux sont ceux qui ont suivi cette voie et fait don de leur vie au nom d'Innos.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //(sérieux) Jurez-vous que vos actes honnoreront leur sacrifice et clameront la gloire d'Innos ?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //Oui, je le jure !
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Dans ce cas, à partir de maintenant, vous faites partie de notre confrérie.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Par ces mots je fais de vous un guerrier d'Innos.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Voici les armes et l'armure de tout chevalier. Portez-les avec fierté !

	CreateInvItems (self,ITAR_PAL_M,1);
	B_GiveInvItems (self,other,ITAR_PAL_M,1);

	if ((other.HitChance[NPC_TALENT_2H]) >= (other.HitChance[NPC_TALENT_1H])) //Damit der SC auch seine Lieblingswaffe bekommt ;-)
	{
		CreateInvItems (self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems (self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_1h_Pal_Sword,1);
	};		 
	
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,ITAR_PAL_M);

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //Votre grade vous autorise dorénavant l'accès au monastère.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Allez trouver Albrecht, il vous enseignera l'art de la magie.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //Et les quartiers que nous possédons dans la ville haute vous sont désormais ouverts, cela va de soi.

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	
	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};


//***********************************************
//	Wie kann ich mich würdig erweisen
//***********************************************

INSTANCE DIA_Lord_Hagen_WhatProof		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	991;
	condition	 = 	DIA_Lord_Hagen_WhatProof_Condition;
	information	 = 	DIA_Lord_Hagen_WhatProof_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Comment puis-je prouver ma valeur ?";
};

FUNC INT DIA_Lord_Hagen_WhatProof_Condition ()
{	
	if (Hagen_GaveInfoKnight == TRUE)	
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_WhatProof_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Comment puis-je m'en montrer digne ?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //Ce sont vos actes qui le montreront.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //Nous luttons pour la justice et la liberté, au nom d'Innos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Nous combattons Béliar et ses sbires, qui cherchent à détruire l'ordre établi par Innos.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Je comprends.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //Vous ne comprenez rien du tout ! Notre honneur est notre vie, et celle-ci appartient à Innos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Un paladin se bat en chantant les louanges d'Innos et nombre d'entre nous ont perdu la vie sur l'autel du conflit éternel opposant le Bien au Mal.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //Nous avons tous prêté serment de faire perdurer cette tradition. Si nous échouons, nous salirons les exploits de nos frères tombés au champ d'honneur.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Il faut comprendre cela pour être digne de devenir paladin.
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lord_Hagen_KAP3_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   PERM KAP 3
// ************************************************************

var int Hagen_KnowsEyeKaputt;
// --------------------------

INSTANCE DIA_Lord_Hagen_KAP3U4_PERM(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 998;
	condition	= DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information	= DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent	= TRUE;
	description = "Comment ça se passe ?";
};                       
FUNC INT DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3U4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Comment ça va ?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Je dois trouver le moyen de secourir l'expédition.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Il faut faire quelque chose contre les dragons.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //(se parle tout seul) Peut-être l'Œil d'Innos pourra-t-il nous sauver, désormais...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Je vais finir par devenir fou ici. Je suis un soldat, pas un bureaucrate.
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //Avec toute cette paperasserie, j'en ai presque oublié l'effet que cela fait d'avoir une épée à la main.
	};
};

// ************************************************************
// 	  				   PERM KAP3U4
// ************************************************************

INSTANCE DIA_Lord_Hagen_EyeBroken(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 1;
	condition	= DIA_Lord_Hagen_EyeBroken_Condition;
	information	= DIA_Lord_Hagen_EyeBroken_Info;
	permanent	= FALSE;
	description = "J'ai l'Œil… Il est brisé.";
};                       
FUNC INT DIA_Lord_Hagen_EyeBroken_Condition()
{
	if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE)	))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_EyeBroken_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //J'ai l'Œil, mais il a été détruit.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //Quoi ? Par Innos, qu'avez-vous fait ? Nous en avons besoin !
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Allez voir Pyrokar ! Il doit bien exister un moyen de le reconstituer !
	Hagen_KnowsEyeKaputt = TRUE;
};

//*********************************************************************
//	Info BACKINTOWN
//*********************************************************************

instance DIA_Lord_Hagen_BACKINTOWN		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_BACKINTOWN_Condition;
	information	 = 	DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Je vous apporte des nouvelles de Garond.";
};
func int DIA_Lord_Hagen_BACKINTOWN_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) >= 1)
	&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_BACKINTOWN_Info ()
{
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Je vous apporte des nouvelles de Garond. Tenez, il m'a remis ce message à votre intention.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //La situation est pire que je ne le craignais. Mais faites-moi votre rapport concernant la Vallée des mines.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Les paladins sont piégés à l'intérieur du château de la Vallée des mines, encerclés par les orques.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Les opérations de prospection se sont traduites par de nombreuses pertes en vies humaines et il ne reste presque plus de minerai.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //A mon avis, sans aide, vos hommes sont perdus. Leur situation semble vraiment désespérée.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Je trouverai le moyen de les secourir. Vous avez fait beaucoup pour nous. Innos saura vous remercier.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Sa gratitude ne m'intéresse pas. Ce que je veux, c'est Son Œil.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Oui, bien sûr. Je n'ai qu'une parole. Prenez cette lettre, elle vous ouvrira les portes du monastère.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Adressez-vous à Pyrokar, le plus grand des Magiciens du feu, et montrez-lui cette autorisation. En la voyant, il vous permettra d'accéder à l'Œil d'Innos.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //Une dernière chose, avant que vous ne partiez...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //Prenez cette rune en gage de remerciement de ma part. Elle vous ramènera en ville sans coup férir chaque fois que vous en éprouverez le besoin.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Le seigneur Hagen m'a remis un message pour que maître Pyrokar me remette l'Œil d'Innos au monastère.");

			Wld_InsertNpc 		(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
			Wld_InsertNpc		(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
			Wld_InsertNpc		(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09"); 
			Wld_InsertNpc		(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
			B_KillNpc 			(BDT_1020_Bandit_L);	//Joly: macht Platz für DMT_1200_Dementor
			Wld_InsertNpc		(DMT_1200_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1201_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1202_Dementor, "NW_TROLLAREA_RITUAL_01");
			//Wld_InsertNpc		(DMT_1203_Dementor, "NW_TROLLAREA_RITUAL_02");//Joly:waren zu viele!
			Wld_InsertNpc		(DMT_1204_Dementor, "NW_TROLLAREA_RITUAL_03");
			//Wld_InsertNpc		(DMT_1205_Dementor, "NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc		(DMT_1206_Dementor, "NW_TROLLAREA_RITUAL_05");
			Wld_InsertNpc		(DMT_1207_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1208_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1209_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1210_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1211_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			B_StartOtherRoutine (Pedro,"Tot"); 
				if (Npc_IsDead (MiltenNW))	//Wichtig, damit Milten vor dem Kloster steht!!!!!
				{ 
					Wld_InsertNpc (PC_MAGE_NW ,"NW_MONASTERY_ENTRY_01");
					B_StartOtherRoutine (MiltenNW,"START");		//zur Sicherheit
				};		
			Wld_InsertNpc		(NOV_650_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_650_ToterNovize);
			Wld_InsertNpc		(NOV_651_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_651_ToterNovize);
			Wld_InsertNpc		(NOV_652_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_652_ToterNovize);
			Wld_InsertNpc		(NOV_653_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_653_ToterNovize);
			Wld_InsertNpc		(NOV_654_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_654_ToterNovize);
			Wld_InsertNpc		(NOV_655_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_655_ToterNovize);
			Wld_InsertNpc		(NOV_656_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_656_ToterNovize);
	
			TEXT_Innoseye_Setting	=	TEXT_Innoseye_Setting_Broken; 
			Wld_InsertItem		(ItMi_InnosEye_Broken_Mis , "FP_TROLLAREA_RITUAL_ITEM"); 
};

//--------Hier kommt der gesamte Befreie den schmied Klumpatsch-------------


//*********************************************************
//		Lasse Bennet aus dem Knast
//*********************************************************

var int Hagen_einmalBennet;
// -----------------------

INSTANCE DIA_Lord_Hagen_RescueBennet		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_RescueBennet_Condition;
	information	 = 	DIA_Lord_Hagen_RescueBennet_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Je dois vous parler de Bennet.";
};

FUNC INT DIA_Lord_Hagen_RescueBennet_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Cornelius_IsLiar == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Il faut que je vous parle de Bennet.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Bennet ? Ce mercenaire a assassiné l'un de mes hommes.
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Comment se fait-il que vous soyez certain de la culpabilité de Bennet ?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Je crois que Bennet est innocent.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Bennet pourrait nous aider à réparer l'Œil d'Innos.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Il pourrait nous aider à reconstituer l'Œil d'Innos.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //Même s'il avait le pouvoir d'appeler Innos lui-même...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //Il a assassiné un paladin et il sera exécuté pour ce crime !
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Comment pouvez-vous être si sûr que c'est lui le tueur ?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //Nous avons un témoin.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Comme vous le voyez, sa culpabilité ne fait aucun doute.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Qui est ce témoin ?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornélius, le secrétaire du gouverneur, a assisté au meurtre.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //La description qu'il a faite du tueur correspond à celle de Bennet. Pour ma part, cela règle la question.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Le mercenaire sera pendu jusqu'à ce que mort s'ensuive.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornélius, le secrétaire du gouverneur, est le témoin. Il affirme avoir assisté au meurtre."); 

	RecueBennet_KnowsCornelius = TRUE;
	//RescueBennet_KnowsWitness = TRUE; 
};
/*
FUNC VOID DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekretär des Statthalters, hat den Mord gesehen.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache für mich erledigt.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der Söldner wird wegen Landesverrats hängen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, der Sekretär des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben."); 

	RecueBennet_KnowsCornelius = TRUE;
};
*/
FUNC VOID DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //Je pense que Bennet est innocent.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Les preuves sont pourtant irréfutables. Il est coupable.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //Et si ces preuves n'étaient pas fiables ?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Mesurez vos paroles. Ce genre d'accusation est extrêmement grave.
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Si vous n'êtes pas en position de prouver que le témoin a menti, je vous conseille de vous taire.
};


//**************************************************************
//	Cornelius hat gelogen.	
//**************************************************************

INSTANCE DIA_Lord_Hagen_Cornelius		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_Cornelius_Condition;
	information	 = 	DIA_Lord_Hagen_Cornelius_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Cornélius a menti.";
};

FUNC INT DIA_Lord_Hagen_Cornelius_Condition ()
{	
	if (Npc_HasItems (other,ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (Cornelius_IsLiar == TRUE)
	&& (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Cornelius_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Cornélius a menti.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Comment savez-vous ça ?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Tenez, j'ai là son journal intime. Tout y est consigné.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //(furieux) Le sale petit criminel !
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //Compte tenu de ces nouvelles preuves, je n'ai pas le choix.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //En vertu des pouvoirs qui me sont conférés par le roi et par l'Eglise, je déclare...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //... que le prisonnier Bennet est lavé de toutes les charges qui étaient retenues contre lui et qu'il est désormais un homme libre.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Quant à Cornélius, il va être arrêté sur-le-champ pour parjure.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Inutile de vous déranger pour si peu, Cornélius est mort.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //Dans ce cas, il n'a eu que ce qu'il méritait. Bien joué !
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Il se fait extrêmement discret ces temps-ci.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Il finira bien par ressurgir un jour ou l'autre. Et à ce moment-là, nous mettrons la main sur lui.
		B_StartOtherRoutine (Cornelius,"FLED");
	}
	else 
	{
		B_StartOtherRoutine (Cornelius,"PRISON");
	};
	
	
	MIS_RescueBennet = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_RescueBennet);
	
	if (hero.guild == GIL_MIL)
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Vos actes seraient tout à l'honneur de l'un des nôtres.
	};
};
//--------Hier endet der gesamte Befreie den Schmied Klumpatsch-------------




//**************************************************************
//	Auge Innos ganz!	
//**************************************************************

INSTANCE DIA_Lord_Hagen_AugeAmStart	(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	4;
	condition	 = 	DIA_Lord_Hagen_AugeAmStart_Condition;
	information	 = 	DIA_Lord_Hagen_AugeAmStart_Info;
	permanent	 = 	FALSE; 
	description	 = 	"J'ai l'Œil sur moi.";
};

FUNC INT DIA_Lord_Hagen_AugeAmStart_Condition ()
{	
	if (Kapitel <= 4)
	&& (MIS_ReadyForChapter4 == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_AugeAmStart_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //Je porte l'Œil
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //(avec révérence) Vous portez l'Œil !
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //Et vous l'avez reconstitué !
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //Alors, vous êtes un Elu d'Innos !
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Je vais aller tuer tous les dragons de la Vallée des mines.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //Innos soit avec vous. Faites appel à son pouvoir pour venir à bout du Mal.
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Lord_Hagen_KAP4_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Antipaladine
///////////////////////////////////////////////////////////////////////

instance DIA_Lord_Hagen_ANTIPALADINE(C_INFO)
{
	npc		 	= 	PAL_200_Hagen;
	nr		 	= 	3;
	condition	 = 	DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information	 = 	DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Les guerriers d'élite orques attaquent la région.";
};

func int DIA_Lord_Hagen_ANTIPALADINE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)))
	&& (Hagen_SawOrcRing == FALSE)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};
var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Les guerriers d'élite orques attaquent le pays.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"J'ai parlé au seigneur Hagen de la progression des hordes de seigneurs orques."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Qu'est-ce qui vous fait dire cela ?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //J'ai parlé à l'un d'eux et votre nom a été mentionné au cours de la conversation.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //C'est proprement ridicule ! Aucun de mes hommes n'a fait état d'une invasion massive d'orques.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Peut-être certains de leurs éclaireurs se sont-ils perdus dans les bois...

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //Il ne s'agissait pas d'éclaireurs. J'ai pris cet anneau à l'un d'eux.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Montrez-le moi.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Hmm... Voilà qui est troublant.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //C'est un signe de leur force. Ils ont donc quitté leurs palissades pour venir nous affronter à découvert.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Jusque-là je n'en ai pas vu beaucoup. Surtout leurs chefs de guerre et quelques guerriers.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //Et alors ? Ils doivent mijoter autre chose. Le fait que leurs chefs quittent l'abri de leurs palissades ne leur ressemble pas du tout.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Cela étant, c'est une excellente occasion de leur porter un coup terrible.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Si jamais ils venaient à perdre leurs chefs, leur moral ne s'en relèverait sans doute pas.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //Voilà votre nouvelle mission, chevalier : tuer tous les chefs orques que vous trouverez dans la région.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Rapportez-moi leurs anneaux. Cela devrait porter un coup sévère aux orques.
			
			B_LogEntry (TOPIC_OrcElite,"Comme preuve, j'ai réussi à ramener à Hagen l'anneau d'un chef de guerre orque. Il m'a demandé de lui rapporter tous ceux que je pourrais trouver."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Demandez à Ingmar de vous en parler. Il pourra vous donner quelques conseils tactiques quant au meilleur moyen d'affronter les chefs orques.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Les guerriers d'élite orques sont ses adversaires de prédilection. Il faut dire qu'il en affronte souvent...
			B_LogEntry (TOPIC_OrcElite,"Les guerriers d'élite orques sont la spécialité d'Ingmar."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //Votre parole selon laquelle vous avez tué le chef de guerre suprême des orques ne me suffit pas.
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Il me faut des preuves avant d'agir.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen veut bien me croire. Il exige des preuves que les guerriers d'élite orques attaquent les terres civilisées. Le contraire m'aurait étonné."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RingeBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_RINGEBRINGEN		(C_INFO)
{
	npc		 = 	PAL_200_Hagen;
	nr		 = 	5;
	condition	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je dois vous signaler autre chose au sujet des seigneurs orques.";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition ()
{
	if (Hagen_SawOrcRing == TRUE)
	&& (Npc_HasItems (other,ItRi_OrcEliteRing) >= 1)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

var int OrkRingCounter;

func void DIA_Lord_Hagen_RINGEBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //J'ai autre chose à vous dire au sujet des chefs de guerre orques.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //Je vous écoute.

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld für einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //J'ai un nouvel anneau d'orque à vous remettre.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //J'ai de nouveaux anneaux d'orques à vous remettre.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Je suis fier de vous. Continuez comme cela !

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //Il se peut qu'il en reste encore quelques-uns dans les environs.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Bientôt ils seront à genoux devant nous.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Cela me surprendrait que vous en trouviez beaucoup d'autres.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Vous pouvez continuer de me ramener leurs anneaux si vous le souhaitez, mais je pense que le message est maintenant passé.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Attendez, laissez-moi vous donner un peu d'or pour vous permettre d'acheter un meilleur équipement.

	OrcRingGeld	= (Ringcount * HagensRingOffer);	

	CreateInvItems (self, ItMi_Gold, OrcRingGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OrcRingGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lord_Hagen_KAP5_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************************
//		Die Drachen sind tot
//****************************************************************************

INSTANCE DIA_Lord_Hagen_AllDragonsDead(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_AllDragonsDead_Condition;
	information	= DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Les dragons sont morts.";
};                       
FUNC INT DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Les dragons sont morts.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //Je savais qu'Innos vous donnerait la force de les terrasser !
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Où est le minerai ?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Les orques font toujours le siège du château de la Vallée des mines. Garond et ses hommes n'ont pas la moindre chance de sortir de la place forte tant que celle-ci sera encerclée.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //(furieux) Malédiction !
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Si Garond ne peut rien faire pour remédier à la situation, je vais devoir m'en charger moi-même...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //Les orques qui m'arrêteront ne sont pas encore nés !
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //J'ai déjà informé mes hommes que notre départ était imminent.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Nous allons tous nous mettre en route. Je ne laisserai qu'une garde minimale autour du navire.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //Voilà qui devrait mettre un terme une bonne fois pour toutes aux problèmes que nous posent les orques !

	MIS_SCVisitShip = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ShipFree");	
};

// ************************************************************
// 	  				   Ich brauche das Schiff
// ************************************************************

INSTANCE DIA_Lord_Hagen_NeedShip(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_NeedShip_Condition;
	information	= DIA_Lord_Hagen_NeedShip_Info;
	permanent	= FALSE;
	description = "J'ai besoin d'un navire.";
};                       
FUNC INT DIA_Lord_Hagen_NeedShip_Condition()
{
	if (ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_NeedShip_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Il me faut un bateau.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //Beaucoup de gens sont dans votre cas, soldat.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //(éclate de rire) J'entends ces mots presque chaque jour, révérend, mais...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Vous n'avez même pas de capitaine, sans parler de l'équipage...
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //Et le navire au mouillage dans la rade ?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Il m'appartient. C'est lui qui nous servira à transporter le minerai.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Une fois que ce sera fait, vous pourrez me le redemander.
};


// ************************************************************
// 	  				 Tor auf
// ************************************************************

INSTANCE DIA_Lord_Hagen_GateOpen (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_GateOpen_Condition;
	information	= DIA_Lord_Hagen_GateOpen_Info;
	permanent	= FALSE;
	description = "Les orques ont pris le château de la Vallée des mines !";
};                       
FUNC INT DIA_Lord_Hagen_GateOpen_Condition()
{
	if (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_GateOpen_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Les orques ont envahi le château de la Vallée des mines !
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //Par Innos ! Que s'est-il passé, au juste ?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //Quelqu'un a dû leur ouvrir la grande porte...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //Quelqu'un ? Il y aurait donc eu un traître à l'intérieur du château ?
};

// ************************************************************
// 	  						 PERM
// ************************************************************

INSTANCE DIA_Lord_Hagen_Perm5 (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_Perm5_Condition;
	information	= DIA_Lord_Hagen_Perm5_Info;
	permanent	= TRUE;
	description = "Qu'attendez-vous ?";
};                       
FUNC INT DIA_Lord_Hagen_Perm5_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_Perm5_Info()
{	
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //Qu'attendez-vous ?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Nous attendons encore notre équipement et nos provisions. Nous nous mettrons en route dès que nous les aurons.
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Maintenant que le château a été pris, il nous faut encore plus de provisions.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //Mais cela ne diffèrera guère notre départ.
	};
};
