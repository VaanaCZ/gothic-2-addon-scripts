///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rengaru_EXIT   (C_INFO)
{
	npc         = VLK_492_Rengaru;
	nr          = 999;
	condition   = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rengaru_PICKPOCKET (C_INFO)
{
	npc			= VLK_492_Rengaru;
	nr			= 900;
	condition	= DIA_Rengaru_PICKPOCKET_Condition;
	information	= DIA_Rengaru_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rengaru_PICKPOCKET_Condition()
{
	C_Beklauen (20, 5);
};
 
FUNC VOID DIA_Rengaru_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice		(DIA_Rengaru_PICKPOCKET, DIALOG_BACK 		,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rengaru_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rengaru_PICKPOCKET);
};
	
func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rengaru_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hauab
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_Hauab		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  2;
	condition	 = 	DIA_Rengaru_Hauab_Condition;
	information	 = 	DIA_Rengaru_Hauab_Info;
	permanent	 =  TRUE;
	description	 = 	"Que faites-vous ici ?";
};
func int DIA_Rengaru_Hauab_Condition ()
{	
	if (Jora_Dieb != LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Rengaru_GOTYOU) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Rengaru_Hauab_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_Hauab_15_00"); //Que faites-vous ici ?
	AI_Output (self, other, "DIA_Rengaru_Hauab_07_01"); //Ça ne vous regarde pas ! Débarrassez-moi le plancher !
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HalloDieb
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_HALLODIEB		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  2;
	condition	 = 	DIA_Rengaru_HALLODIEB_Condition;
	information	 = 	DIA_Rengaru_HALLODIEB_Info;
	permanent	 =  FALSE;
	description	 = 	"Jora dit que vous avez son argent...";
};
func int DIA_Rengaru_HALLODIEB_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_HALLODIEB_15_00"); //Jora dit que vous avez son argent...
	AI_Output (self, other, "DIA_Rengaru_HALLODIEB_07_01"); //Bon sang ! Je me tire d'ici !

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"RunAway");  
};
///////////////////////////////////////////////////////////////////////
//	Info GotYou
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_GOTYOU		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  3;
	condition	 = 	DIA_Rengaru_GOTYOU_Condition;
	information	 = 	DIA_Rengaru_GOTYOU_Info;
	permanent	 =  FALSE;	
	description	 = 	"Attrapé !";
};

func int DIA_Rengaru_GOTYOU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info ()
{
	B_GivePlayerXP (XP_RengaruGotThief);
	
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_00"); //Je vous tiens !
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_07_01"); //Qu'est-ce que vous me voulez ?
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_02"); //Vous avez volé en plein jour et il vous a vu faire.
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_15_03"); //Alors, je suis venu vous dire que vous étiez le plus minable des voleurs...
	
	Info_ClearChoices (DIA_Rengaru_GOTYOU); 
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "... je mérite une part du butin.", DIA_Rengaru_GOTYOU_Anteil );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "... vous feriez mieux de me donner l'or de Jora.", DIA_Rengaru_GOTYOU_YouThief );
	Info_AddChoice	(DIA_Rengaru_GOTYOU, "... et maintenant vous allez me dire qui vous êtes.", DIA_Rengaru_GOTYOU_WhoAreYou );
};
func void DIA_Rengaru_GOTYOU_YouThief ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_YouThief_15_00"); //... et que vous aviez intérêt à me rendre l'argent de Jora, sinon...

	if (Npc_HasItems (self, Itmi_Gold) >= 1)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_01"); //Voilà le blé, mec. Laissez-moi partir, je ne recommencerai jamais, promis !
		B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self, ItMi_Gold));
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_02"); //Je n'ai plus cet argent.
		
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
		{
			AI_Output (self, other, "DIA_Rengaru_GOTYOU_YouThief_07_03"); //Mais pourquoi je vous dit ça ? Vous m'avez déjà volé !
		};
	};	
	Info_ClearChoices	(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_15_00"); //Je mérite bien ma part du butin.
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)    
	&& (Npc_HasItems (self, ItMi_Gold) < 1)
	{ 
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_07_01"); //Vous m'avez déjà tout pris après m'avoir assommé, alors, laissez-moi partir !
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{	//HACK MF. self/other - falsch gesprochen, kein Ersatz...
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_15_02"); //Très bien. Puisque je n'ai pas le choix, faisons moitié-moitié.
		
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "Non, donnez-moi tout.", DIA_Rengaru_GOTYOU_Anteil_alles );
		Info_AddChoice		(DIA_Rengaru_GOTYOU, "Très bien, donnez-moi la moitié.", DIA_Rengaru_GOTYOU_Anteil_GehtKlar );
	};
};
func void DIA_Rengaru_GOTYOU_Anteil_alles ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_alles_15_00"); //Non. Donnez-moi tout.
	
	if (Npc_HasItems (self, Itmi_Gold) >= 2)
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_02"); //Vous avez décidé de me voler, c'est ça ? Prenez-le ce satané or ! Et laissez-moi tranquille !
		B_GiveInvItems (self, other, ItMi_Gold, Npc_HasItems (self, ItMi_Gold) );
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else 
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_03"); //Je vous donnerais bien l'argent, mais je ne l'ai plus.
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00"); //D'accord. Donnez-m'en la moitié alors.
	
	if B_GiveInvItems (self, other, ItMi_Gold, (Npc_HasItems (self, ItMi_Gold))/2 )
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01"); //La voilà, votre moitié ! Et maintenant, laissez-moi partir !
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02"); //Ça ne me dérangerait pas de vous donner la moitié, mais je n'ai plus l'argent.
		Info_ClearChoices	(DIA_Rengaru_GOTYOU);
	};
};
func void DIA_Rengaru_GOTYOU_WhoAreYou ()
{
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_00"); //Et maintenant, dites-moi qui vous êtes.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_01"); //Je ne suis qu'un pauvre diable cherchant à subsister comme il peut.
	AI_Output (self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_02"); //Que puis-je faire d'autre ? Je ne trouve pas de travail en ville, et ...
	AI_Output (other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_03"); //D'accord, d'accord, je vois. Epargnez-moi vos jérémiades.
};
///////////////////////////////////////////////////////////////////////
//	Info InKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_INKNAST		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr 			 =  4;
	condition	 = 	DIA_Rengaru_INKNAST_Condition;
	information	 = 	DIA_Rengaru_INKNAST_Info;
	permanent 	 =  FALSE;
	description	 = 	"Je devrais vous remettre aux mains de la milice.";
};

func int DIA_Rengaru_INKNAST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_15_00"); //Je devrais vous livrer à la milice.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_07_01"); //Qu'est-ce que vous voulez d'autre ? Je n'ai plus rien ! Laissez-moi partir, mec !
	
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Pourquoi ferais-je ça ?", DIA_Rengaru_INKNAST_keinKnast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Je veillerai à ce que vous soyez mis derrière les barreaux.", DIA_Rengaru_INKNAST_Knast );
	Info_AddChoice	(DIA_Rengaru_INKNAST, "Allez au diable ! Et ne revenez plus jamais ici !", DIA_Rengaru_INKNAST_HauAb );
};
func void DIA_Rengaru_INKNAST_HauAb ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_HauAb_15_00"); //Disparaissez ! Et que je ne vous revoie plus jamais par ici !
	AI_Output (self, other, "DIA_Rengaru_INKNAST_HauAb_07_01"); //Vous ne le regretterez pas ! Merci, mec !
	
	Npc_ExchangeRoutine	(self,"Start"); 	
	AI_StopProcessInfos (self);
	
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
};
func void DIA_Rengaru_INKNAST_Knast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_Knast_15_00"); //Je veillerai à ce que vous finissiez derrière les barreaux.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_01"); //(las) Je ne veux plus d'ennuis. Si vous croyez que c'est ce qu'il faut faire, je vous en prie.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_Knast_07_02"); //(menaçant) Mais attention, parce que mes amis risquent fort de ne pas apprécier...

	
	Rengaru_InKnast		= TRUE; 	
	
	AI_StopProcessInfos (self);
};

func void DIA_Rengaru_INKNAST_keinKnast ()
{
	AI_Output (other, self, "DIA_Rengaru_INKNAST_keinKnast_15_00"); //Pourquoi aurais-je intérêt à faire ça ?
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_01"); //En ville, il est toujours bon de connaître certaines personnes... et de ne pas se les mettre à dos.
	AI_Output (self, other, "DIA_Rengaru_INKNAST_keinKnast_07_02"); //Je pourrais leur glisser un mot à votre sujet. Je n'en dirai pas davantage. A vous de voir.
};
///////////////////////////////////////////////////////////////////////
//	Info LastInfoKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_LastInfoKap1		(C_INFO)
{
	npc			 = 	VLK_492_Rengaru;
	nr			 =  6;
	condition	 = 	DIA_Rengaru_LastInfoKap1_Condition;
	information	 = 	DIA_Rengaru_LastInfoKap1_Info;
	permanent	 =  TRUE;	
	description	 = 	"Alors ? Ça se passe bien ?";
};
func int DIA_Rengaru_LastInfoKap1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info ()
{
	AI_Output (other, self, "DIA_Rengaru_LastInfoKap1_15_00"); //Alors ? Ça va ?
	
	if (Rengaru_InKnast	== TRUE)
	{
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_01"); //Allez-y, foutez-vous de moi ! Mais vous finirez par me le payer, je vous le promets !
	}
	else
	{
		AI_Output (self, other, "DIA_Rengaru_LastInfoKap1_07_02"); //Qu'est-ce que vous voulez d'autre ? J'ai plus rien volé, promis, mec !
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rengaru_Zeichen   (C_INFO)
{
	npc         = VLK_492_Rengaru;
	nr          = 2;
	condition   = DIA_Rengaru_Zeichen_Condition;
	information = DIA_Rengaru_Zeichen_Info;
	permanent   = FALSE;
	description = "(Faire le signe de reconnaissance des voleurs)";
};

FUNC INT DIA_Rengaru_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (Rengaru_InKnast == FALSE)
	&& Npc_KnowsInfo (other, DIA_Rengaru_GOTYOU)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_00");//Hé, vous êtes des nôtres !
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_01");//Laissez-moi vous dire un truc : si vous avez l'intention de faire les poches des gens en ville, faites particulièrement attention avec les marchands.
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_02");//Ils sont particulièrement attentifs pour ce qui est de surveiller leur marchandise. Mais je peux quand même vous donner un conseil...
	AI_Output (self, other, "DIA_Rengaru_Zeichen_07_03");//Essayez de vous emparer de l'objet souhaité d'une main, tout en faisant des gestes de l'autre afin de détourner leur attention.
	
	B_RaiseAttribute(other, ATR_DEXTERITY, 1);
	Snd_Play ("LEVELUP"); 
};
