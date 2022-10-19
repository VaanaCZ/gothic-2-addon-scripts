// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Buster_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_EXIT_Condition;
	information	= DIA_Buster_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Buster_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Buster_Hello (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_Hello_Condition;
	information	= DIA_Buster_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Buster_Hello_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) //Wegen News - Info kommt nicht mehr gut, wenn schonmal geprügelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Chi abbiamo qui? Non ti ho già incontrato?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Se lo dici tu. Sto andando a parlare con il proprietario." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "Chi vuole saperlo?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //Chi vuole saperlo?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Sono Buster, uno dei mercenari di Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //E TU faresti meglio a essere un po' più rispettoso con me, o avrò la tua pelle!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //D'accordo, cosa vuoi?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Non sono affari tuoi."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Conosco Lee!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Sono un semplice viaggiatore diretto a incontrare il locandiere." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Conosco Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Tutti conoscono Lee! Non significa nulla, amico. Al momento però stai parlando con ME!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Dunque, dove stai andando?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Non sono affari tuoi."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Sono un semplice viaggiatore diretto a incontrare il locandiere." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Non sono affari tuoi.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Nessuno può parlarmi in quel modo, verme! Penso sia giunto il momento di darti una bella lezione!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Se lo dici tu. Sto andando a parlare con il proprietario.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //Davvero... Mmmh, non mi sembri così pericoloso.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Vuoi scoprirlo?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Ho ucciso un paio di bestie in qualche occasione."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "Hai capito bene." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //Hai capito bene.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //(soddisfatto) Già, con gli anni impari a capire queste cose al primo colpo, amico.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //Siamo abituati a combattere gli orchi un giorno sì e uno no. O le guardie della città. Sono dei piccoli insetti ostinati. (ride)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Intendi orchi VERI? Quelle grosse bestie?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "E allora?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Impressionante." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Ho ucciso un paio di bestie in qualche occasione.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ah! (ride) Probabilmente avrai schiacciato qualche insetto nei campi e inseguito un paio di topi fino ai loro buchi.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Qui ci occupiamo di orchi! Beh, sì, anche di quelle maledette guardie cittadine. (ride)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Intendi orchi VERI? Quelle grosse bestie?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "E allora?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Impressionante." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Vuoi scoprirlo?
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Oh, aiuto! Ho scelto la persona sbagliata, non è vero?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Puoi dirlo forte.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //Allora vieni, mostrami cosa sai fare.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Impressionante.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //(ride) È il nostro mestiere, ragazzo! Creiamo noi stessi armi e armature!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Sfidiamo la morte ogni giorno. Ma un bifolco di campagna come te non può capirlo.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Immagino di doverti dimostrare quanto io sia al corrente della situazione!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Come desideri."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Come desideri.
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //(con un grugnito) Sparisci, pulce!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Immagino di doverti dimostrare quanto io sia al corrente della situazione!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //Intendi fare una rivolta contadina tutto da solo, allora?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //D'accordo dunque, mostrami cosa sai fare.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //E allora?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //(sbuffa) Come se sapessi di cosa stai parlando. Pensi di essere forte, non è vero?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //(arrabbiato) Forse è giunto il momento che qualcuno ti dia una bella lezione!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Quando vuoi!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Stavo solo scherzando..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Intendi orchi VERI? Quelle grosse bestie?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //(sospira) Intendo... Aspetta un momento! Mi stai forse prendendo in giro?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //(sorridendo) Lungi da me.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Verme! (aggressivamente) Te la sei cercata, eh?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //Allora vieni e mostrami cosa sai fare, eroe!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Quando vuoi!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Stavo solo scherzando..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //Quando vuoi!
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //Avvicinati allora, amico!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //Stavo solo scherzando...
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //Già, bravo, abbassa la cresta! Sparisci subito dalla mia vista!
	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				 FightNone
// ************************************************************

INSTANCE DIA_Buster_FightNone (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_FightNone_Condition;
	information	= DIA_Buster_FightNone_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Buster_FightNone_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Buster_Hello))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Cosa vuoi, pulce?
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************

INSTANCE DIA_Buster_Duell (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 3;
	condition	= DIA_Buster_Duell_Condition;
	information	= DIA_Buster_Duell_Info;
	permanent	= TRUE;
	description = "Ti sfido in duello!";
};                       

FUNC INT DIA_Buster_Duell_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Duell_Info()
{	
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Ti sfido in duello!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ah-ha! Non puoi startene in pace, eh? D'accordo, fatti sotto!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Vuoi provarci ancora? Insetto noioso, d'accordo, fatti sotto!
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //Ma non fuggire di nuovo!
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************
INSTANCE DIA_Buster_WannaJoin (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WannaJoin_Condition;
	information	= DIA_Buster_WannaJoin_Info;
	permanent	= TRUE;
	description = "Voglio unirmi ai mercenari!";
};                       

FUNC INT DIA_Buster_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Buster_Duell == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WannaJoin_Info()
{	
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Voglio unirmi ai mercenari!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Chiunque sappia pestare duramente come te non dovrebbe avere troppi problemi da queste parti.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Non sei il migliore dei guerrieri, ma almeno non sei un codardo.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Il mio voto non conta molto visto che non sono qui da tanto tempo, ma quando Lee me lo chiederà, voterò per te.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Dopo aver sconfitto Buster, egli non ha nessuna obiezione alla mia candidatura per i mercenari.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Tu? Non mi pare che abbiano mai permesso a un codardo di unirsi ai mercenari...
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Fuggire durante un duello... non andrai molto lontano!
		};
	};
};

// ************************************************************
// 		  				 Mehr über Söldner		
// ************************************************************
var int Buster_SentenzaTip;

INSTANCE DIA_Buster_OtherSld (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_OtherSld_Condition;
	information	= DIA_Buster_OtherSld_Info;
	permanent	= FALSE;
	description = "Voglio trovare altre informazioni sui mercenari e su questa regione.";
};                       

FUNC INT DIA_Buster_OtherSld_Condition()
{
	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
		{
				return TRUE;	
		};
};
 
FUNC VOID DIA_Buster_OtherSld_Info()
{	
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Voglio trovare altre informazioni sui mercenari e su questa regione.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //Non posso dirti molto sulla regione. Faresti meglio a chiedere ai contadini.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //Per quanto riguarda noi mercenari abbiamo una regola molto semplice: se sei in grado di difendere le tue idee, sei dei nostri.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Penso tu sia fatto della pasta giusta per essere uno di noi.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Ma non devi montarti la testa per la fortuna che hai avuto nel nostro ultimo scontro.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Ci sono molti tizi nella fattoria che sono meglio di me...
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Sentenza, per esempio. Controlla l'ingresso della fattoria. Qualsiasi cosa tu faccia, non combattere contro di lui.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Ma perché sto dicendo tutto questo a TE, pulce!
		AI_StopProcessInfos (self);		
	};
};

// ************************************************************
// 		  				About Sentenza		
// ************************************************************
var int Buster_GoldZumBrennen;
var int Buster_Bonus;

INSTANCE DIA_Buster_AboutSentenza (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_AboutSentenza_Condition;
	information	= DIA_Buster_AboutSentenza_Info;
	permanent	= FALSE;
	description = "E questa Sentenza?";
};                       

FUNC INT DIA_Buster_AboutSentenza_Condition()
{
	if (Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_AboutSentenza_Info()
{	
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //E questa Sentenza?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Cercherà di scucirti dell'oro quando entrerai nella fattoria. Lo fa con tutti i nuovi arrivati.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //E se fossi in te, pagherei. È quello che ho fatto ai tempi. E la cosa buona è che ha votato per me dopo.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Una mano lava l'altra, ha detto. Ho perso tutto il mio oro nello scambio, ma non era comunque molto. E alla fine sono stato soddisfatto.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Una volta l'ho visto picchiare un tizio che aveva deciso di NON pagarlo.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Grazie per il suggerimento.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //Davvero. Potrebbe valere qualcosa per te?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "No.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Ecco prendi... 5 pezzi d’oro.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Ecco prendi... 5 monete d’oro.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Grazie amico. Sembra che potrò bere qualcosa stasera, dopo tutto. Non lo dimenticherò.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //No.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Come pensavo.
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

// ************************************************************
// 		  				 LeeLeader		
// ************************************************************

INSTANCE DIA_Buster_LeeLeader (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_LeeLeader_Condition;
	information	= DIA_Buster_LeeLeader_Info;
	permanent	= FALSE;
	description = "Lee è il capo dei mercenari, non è vero?";
};                       

FUNC INT DIA_Buster_LeeLeader_Condition()
{
	if (Buster_Duell == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_LeeLeader_Info()
{	
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee è il capo dei mercenari, non è vero?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Esatto. Ehi, ora ricordo dove ti ho visto! Anche tu eri nella colonia.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //(sospira) Sì, c'ero anch'io.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Non ti ho visto quando è successo quel disastro. Neanche prima, a dire il vero.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Ho avuto altri problemi.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Ti sei perso parecchio, allora... Le cose sono cambiate da quando eravamo in prigioni assieme.
};


// ************************************************************
// 		  				 WhatHappened		
// ************************************************************

INSTANCE DIA_Buster_WhatHappened (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WhatHappened_Condition;
	information	= DIA_Buster_WhatHappened_Info;
	permanent	= FALSE;
	description = "Cosa ne è stato dei mercenari nella colonia?";
};                       

FUNC INT DIA_Buster_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Buster_LeeLeader))
	&& ((hero.guild != GIL_SLD)&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WhatHappened_Info()
{	
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Cosa ne è stato dei mercenari nella colonia?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Dopo che la Barriera è scomparsa, Lee ci ha guidati fuori dalla colonia. Ha detto che non ci sarebbe potuto succedere nulla se fossimo rimasti tutti uniti. E ha avuto ragione.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Non c'è voluto molto prima che ci trovassimo un posto tranquillo proprio qui. Il proprietario terriero ci paga per tenere lontano l'esercito della città.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //E la maggior parte di noi si sarebbe offerta volontaria per farlo senza nessun compenso.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Ma Onar ci nutre tutti e noi possiamo prendercela comoda fino a quando non capiterà una buona occasione per lasciare questa maledetta isola.
};


//**************************************
//			TrainingGold
//************************************** 
INSTANCE DIA_Buster_Teach (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 8;
	condition	= DIA_Buster_Teach_Condition;
	information	= DIA_Buster_Teach_Info;
	permanent	= TRUE;
	description = "Puoi insegnarmi a combattere meglio?";
};                       

FUNC INT DIA_Buster_Teach_Condition()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_1H) <= 60) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_Teach_Info()
{	
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Puoi insegnarmi a combattere meglio?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //In effetti potrei darti un paio di consigli...
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Non sei così stupido come sembri. D'accordo, ti insegnerò quello che so. Forse allora avrai persino una possibilità contro di me...
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster può insegnarmi il combattimento con le armi a una mano.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_Back ()
{
	Info_ClearChoices (DIA_Buster_Teach);
};

FUNC VOID DIA_Buster_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
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

INSTANCE DIA_Buster_KAP3_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP3_EXIT_Condition;
	information	= DIA_Buster_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Shadowbeasts
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_SHADOWBEASTS		(C_INFO)
{
	npc		 	= Sld_802_Buster;
	nr		 	= 30;
	condition	= DIA_Buster_SHADOWBEASTS_Condition;
	information	= DIA_Buster_SHADOWBEASTS_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Buster_SHADOWBEASTS_Condition ()
{
	if ((Kapitel == 3) || (Kapitel == 4))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void B_DIA_Buster_SHADOWBEASTS_OK ()
{
	AI_StopProcessInfos (self);
};

func void DIA_Buster_SHADOWBEASTS_Info ()
{
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Ehi, tu, amico!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Che vuoi?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //In questi giorni ho pensato a come potremmo fare un po' di soldi facili in questa fogna.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //E allora?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Penso di essere incappato nella possibilità di far soldi velocemente.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Un mercante della città sarebbe disposto a sborsare un mucchio di quattrini per una certa cosa.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Chi è questo mercante di cui parli?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Di cosa si tratta?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Perché mi stai dicendo tutto questo?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Perché mi stai dicendo tutto questo?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Non posso farlo da solo. Devo restare qui e sorvegliare queste stupide pecore.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //I contadini, intendi.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //È quello che ho detto.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //Di cosa si tratta?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Il mercante dice che potrebbe rivendere i corni delle bestie d'ombra con un notevole profitto.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Qualcuno dovrebbe recarsi nei boschi e mietere quelle bestiacce. Ed è qui che entri in gioco tu.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Quanto si guadagna?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Quanto si guadagna?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Un mucchio di soldi, ti dico. Ce ne saranno abbastanza per entrambi.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //E siccome mi hai dato quell'oro in passato, ti farò un prezzo speciale.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //Sembra interessante! Ti farò sapere quando riuscirò a ottenere dei corni.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster mi offrirà un buon prezzo per ogni corno di bestia d'ombra che gli porterò."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Chi è questo mercante di cui parli?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Mi dispiace, amico. Dovrei essere veramente stupido per rivelarti le mie fonti. Stai cercando di scavalcarmi?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //O fai affari con ME, o non ne fai affatto, capisci?

};

///////////////////////////////////////////////////////////////////////
//	Info BringTrophyShadowbeast
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_BringTrophyShadowbeast		(C_INFO)
{
	npc		 = 	Sld_802_Buster;
	nr		 = 	2;
	condition	 = 	DIA_Buster_BringTrophyShadowbeast_Condition;
	information	 = 	DIA_Buster_BringTrophyShadowbeast_Info;
	permanent	 = 	TRUE;

	description	 = 	"Riguardo ai corni di bestia d’ombra...";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition ()
{
	if (MIS_Buster_KillShadowbeasts_DJG == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItAt_ShadowHorn))||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info ()
{
	if ((Kapitel >= 5))
	{
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Il mio mercante di città ci ha lasciati.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Cosa vorresti dire?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //È morto. Puoi tenerti i corni, non saprei cosa farmene ora.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Come si fa a prendere il corno da una bestia d'ombra?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Non lo sai? Oh, mi sarei aspettato di più da te.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Te ne parlerò più avanti.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("Insegnami.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
	}
	else 
	{
		var int BusterTrophyShadowbeastCount;
		var int XP_BringBusterTrophyShadowbeast;
		var int XP_BringBusterTrophyShadowbeasts;
		var int BustersBusterTrophyShadowbeastOffer;
		var int BusterTrophyShadowbeastGeld;
	
		BusterTrophyShadowbeastCount = Npc_HasItems(other, ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = 	(Shadowbeast.level * XP_PER_VICTORY);			
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus; //Joly: Wert ohne Handelmultiplier!!!!!!!!!!!!!
		
	
		if (BusterTrophyShadowbeastCount == 1)
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //Ho un corno di bestia d'ombra per te.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Ho alcuni corni di bestia d'ombra per il tuo mercante.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Ottimo, da' qui. E portamene ancora. Chi lo sa fino a quando quel mercante vorrà ancora queste cose.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Ecco la tua parte.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //Insegnami.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //Ascolta allora. Prima ti occupi della bestia d'ombra, poi afferri il corno con la mano destra più forte che puoi.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Poi infili il coltello nella fronte e tagli una scanalatura nella carne intorno al corno.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Infine usi il coltello per fare leva sul corno, staccarlo dal teschio e mettertelo poi in tasca.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //Bene. E poi lo porti a me. Non dovrebbe essere troppo difficile da farsi.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Te ne parlerò più avanti.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //Lo spero.
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
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

INSTANCE DIA_Buster_KAP4_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP4_EXIT_Condition;
	information	= DIA_Buster_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		  				 	PERM Kapitel 4	
// ************************************************************

INSTANCE DIA_Buster_Perm4 (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_Perm4_Condition;
	information	= DIA_Buster_Perm4_Info;
	permanent	= TRUE;
	description = "Cosa ne pensi dei cacciatori di draghi?";
};                       

FUNC INT DIA_Buster_Perm4_Condition()
{
	if (Kapitel >= 4) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Perm4_Info()
{	
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Cosa ne pensi dei cacciatori di draghi?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //I ragazzi potrebbero uscirne con un sacco di oro, se non muoiono prima.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Personalmente, preferisco restare con Lee.
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

INSTANCE DIA_Buster_KAP5_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP5_EXIT_Condition;
	information	= DIA_Buster_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Buster_KAP6_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP6_EXIT_Condition;
	information	= DIA_Buster_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Buster_PICKPOCKET (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 900;
	condition	= DIA_Buster_PICKPOCKET_Condition;
	information	= DIA_Buster_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Buster_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Buster_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Buster_PICKPOCKET);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_BACK 		,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};
	
func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};








































