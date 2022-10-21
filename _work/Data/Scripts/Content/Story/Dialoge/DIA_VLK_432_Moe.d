///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Moe_EXIT   (C_INFO)
{
	npc         = VLK_432_Moe;
	nr          = 999;
	condition   = DIA_Moe_EXIT_Condition;
	information = DIA_Moe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Moe_PICKPOCKET (C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 900;
	condition	= DIA_Moe_PICKPOCKET_Condition;
	information	= DIA_Moe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen (25, 30);
};
 
FUNC VOID DIA_Moe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Moe_PICKPOCKET);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_BACK 		,DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
	
func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Moe_PICKPOCKET);
};
// ************************************************************
// 			     Hallo
// ************************************************************
INSTANCE DIA_Moe_Hallo(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 2;
	condition	= DIA_Moe_Hallo_Condition;
	information	= DIA_Moe_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       

FUNC INT DIA_Moe_Hallo_Condition()
{	
	if (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Moe_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Moe_Hallo_01_00"); //H�, je ne vous connais pas�! Qu'est-ce que vous voulez�? Vous allez au pub�?
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Non, je ne vais pas � la taverne... (FIN)",DIA_Moe_Hallo_Gehen);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Oh ! C'est �a le bar...",DIA_Moe_Hallo_Witz);
	Info_AddChoice 	  (DIA_Moe_Hallo,"Oui, cela vous ennuie ?",DIA_Moe_Hallo_Reizen);
};
FUNC VOID DIA_Moe_Hallo_Gehen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Gehen_15_00"); //Non.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_01"); //C'est ce que j'aurais r�pondu moi aussi. Mais ce n'est pas grave, et c'est pour cette raison que nous pouvons faire affaire.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_02"); //Comme vous �tes nouveau, je vais vous faire une proposition. Donnez-moi 50 pi�ces d'or et je vous laisse partir.
	AI_Output (self ,other,"DIA_Moe_Hallo_Gehen_01_03"); //Disons que c'est le prix pour entrer au pub.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Voyons ce que la milice va penser de �a...",DIA_Moe_Hallo_Miliz);
	Info_AddChoice    (DIA_Moe_Hallo,"Laissez tomber, vous n'aurez pas une pi�ce !",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Tr�s bien. Je paierai.",DIA_Moe_Hallo_Zahlen);
	Info_AddChoice    (DIA_Moe_Hallo,"Mais je ne veux pas aller � la taverne !",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Kneipe()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Kneipe_15_00"); //Mais je ne veux pas y aller�!
	AI_Output (self ,other,"DIA_Moe_Hallo_Kneipe_01_01"); //Vous savez, un jour ou l'autre, on finit tous par avoir envie d'y aller. Alors, autant me payer tout de suite. Comme �a, ce sera fait.
};
FUNC VOID  DIA_Moe_Hallo_Witz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Witz_15_00"); //Oh, c'est donc ici, le d�bit de boissons du port�? Et moi qui pensais me trouver � l'entr�e du palais du gouverneur...
	AI_Output (self ,other,"DIA_Moe_Hallo_Witz_01_01"); //H�! Arr�tez de faire le malin si vous ne voulez pas bouffer les pissenlits par la racine.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Je vois, je vais �tre contraint de vous tanner le cuir...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Est-ce que vous cherchez des crosses ?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Calmez-vous, je veux juste boire une bi�re.",DIA_Moe_Hallo_Ruhig);
	Info_AddChoice    (DIA_Moe_Hallo,"Mais je ne veux pas aller � la taverne !",DIA_Moe_Hallo_Kneipe);
};
FUNC VOID DIA_Moe_Hallo_Reizen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Reizen_15_00"); //Oui, pourquoi�? �a vous g�ne�?
	AI_Output (self ,other,"DIA_Moe_Hallo_Reizen_01_01"); //Vous n'avez rien � faire ici, avorton.
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Je vois, je vais �tre contraint de vous tanner le cuir...",DIA_Moe_Hallo_Pruegel);
	Info_AddChoice    (DIA_Moe_Hallo,"Est-ce que vous cherchez des crosses ?",DIA_Moe_Hallo_Aerger);
	Info_AddChoice    (DIA_Moe_Hallo,"Calmez-vous, je veux juste boire une bi�re.",DIA_Moe_Hallo_Ruhig);
};
FUNC VOID DIA_Moe_Hallo_Miliz()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Miliz_15_00"); //Si on demandait � la milice ce qu'elle pense de �a�?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_01"); //(�clate de rire) Il n'y a pas de milice dans le coin. Et vous savez pourquoi�?
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_02"); //Parce qu'on est dans le quartier du port, voil� pourquoi, nabot�! Et aucun milicien ne viendra jamais me chercher des noises ici.
	AI_Output (self ,other,"DIA_Moe_Hallo_Miliz_01_03"); //Quand ils viennent dans le coin c'est pour aller � la Lanterne Rouge, c'est tout. Alors, comme vous pouvez voir, c'est entre vous et moi...
};
FUNC VOID DIA_Moe_Hallo_Pruegel()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Pruegel_15_00"); //Je vois. Dans ce cas, j'imagine qu'il va me falloir vous tanner le cuir si je veux avancer.
	AI_Output (self ,other,"DIA_Moe_Hallo_Pruegel_01_01"); //Vous pouvez toujours essayer, nabot�! Allez, montrez-moi ce que vous savez faire�!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Aerger()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Aerger_15_00"); //Vous cherchez � me faire des ennuis�?
	AI_Output (self ,other,"DIA_Moe_Hallo_Aerger_01_01"); //�a oui. C'est m�me comme qui dirait ma sp�cialit�, alors, d�fendez-vous, avorton.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Ruhig()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Ruhig_15_00"); //Du calme, je veux juste boire une bi�re.
	AI_Output (self ,other,"DIA_Moe_Hallo_Ruhig_01_01"); //Pas de probl�me, du moment que vous payez 50 pi�ces d'or pour entrer. (se fend d'un sourire sadique)
	
	Info_ClearChoices (DIA_Moe_Hallo);
	Info_AddChoice    (DIA_Moe_Hallo,"Laissez tomber, vous n'aurez pas une pi�ce !",DIA_Moe_Hallo_Vergisses);
	Info_AddChoice    (DIA_Moe_Hallo,"Tr�s bien. Je paierai.",DIA_Moe_Hallo_Zahlen);
	
};
FUNC VOID DIA_Moe_Hallo_Zahlen()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_00"); //Tr�s bien, je paye.
	
	if B_GiveInvItems (other, self, ItMi_Gold,50)
	{
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_01"); //Excellent�! Oh, et puisque nous nous entendons si bien, autant me donner tout de suite tout ce que vous avez.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Laissez tomber, vous n'aurez pas une pi�ce !",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"D'accord, c'est tout ce que j'ai.",DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems (hero, ItMi_Gold) > 9)
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_02"); //Mais je n'ai pas de quoi payer�!
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_03"); //Ce n'est pas grave. Donnez-moi juste tout ce que vous avez.
		
		Info_ClearChoices (DIA_Moe_Hallo);
		Info_AddChoice    (DIA_Moe_Hallo,"Laissez tomber, vous n'aurez pas une pi�ce !",DIA_Moe_Hallo_Vergisses);
		Info_AddChoice    (DIA_Moe_Hallo,"D'accord, c'est tout ce que j'ai.",DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output (other ,self,"DIA_Moe_Hallo_Zahlen_15_04"); //Mais je n'ai m�me pas 10 pi�ces d'or�!
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_05"); //La vache, je suis tomb� sur un bon�!
		AI_Output (self ,other,"DIA_Moe_Hallo_Zahlen_01_06"); //Bon, d'accord... (soupire) Vous pouvez y aller.
		
		AI_StopProcessInfos (self);
	};

};
FUNC VOID DIA_Moe_Hallo_Vergisses()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Vergisses_15_00"); //N'y songez m�me pas, vous ne tirerez pas la moindre pi�ce de moi�!
	AI_Output (self ,other,"DIA_Moe_Hallo_Vergisses_01_01"); //Dans ce cas, je me servirai moi-m�me... une fois que je vous aurai fait mordre la poussi�re.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Moe_Hallo_Alles()
{
	AI_Output (other ,self,"DIA_Moe_Hallo_Alles_15_00"); //Tenez, c'est tout ce que j'ai.
	
	B_GiveInvItems (other, self, ItMi_Gold, Npc_HasItems (other,ItMi_Gold));
	
	AI_Output (self ,other,"DIA_Moe_Hallo_Alles_01_01"); //Dans ce cas, �a me suffit. Quelle g�n�rosit�, pas vrai�? (se fend d'un sourire sadique)
	AI_StopProcessInfos (self);
};
//************************************************
//	Das Hafenviertel
//************************************************

INSTANCE DIA_Moe_Harbor(C_INFO)
{
	npc			= VLK_432_Moe;
	nr			= 998;
	condition	= DIA_Moe_Harbor_Condition;
	information	= DIA_Moe_Harbor_Info;
	permanent	= TRUE;
	description = "Vous connaissez bien le port, n'est-ce pas ?";
};                       

FUNC INT DIA_Moe_Harbor_Condition()
{
		return TRUE;
};
 
FUNC VOID DIA_Moe_Harbor_Info()
{	
	AI_Output (other,self ,"DIA_Moe_Harbor_15_00"); //Vous connaissez les environs du port, pas vrai�?
	AI_Output (self ,other,"DIA_Moe_Harbor_01_01"); //Bien s�r, pourquoi�?
	
	Info_ClearChoices (DIA_Moe_Harbor);
	Info_AddChoice		(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice		(DIA_Moe_Harbor,"Comment se passe le trafic maritime ?",DIA_Moe_Harbor_Ship);
	Info_AddChoice		(DIA_Moe_Harbor,"Pourquoi est-ce qu'on ne voit de miliciens nulle part ?",DIA_Moe_Harbor_Militia);
	Info_AddChoice 		(DIA_Moe_Harbor,"Quelles rumeurs entend-on par ici ?",DIA_Moe_Harbor_Rumors);
};

FUNC VOID DIA_Moe_Harbor_Back ()
{
	Info_ClearChoices (DIA_Moe_Harbor);
};

FUNC VOID DIA_Moe_Harbor_Ship ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Ship_15_00"); //Il y a beaucoup de bateaux qui circulent ces temps-ci�?
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_01"); //Le seul navire qui soit arriv� r�cemment est celui des paladins.
	AI_Output (self ,other,"DIA_Moe_Harbor_Ship_01_02"); //Il est amarr� juste derri�re la cr�te rocheuse du sud-ouest.
	
};

FUNC VOID DIA_Moe_Harbor_Militia ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Militia_15_00"); //Pourquoi n'y a-t-il pas de miliciens dans le coin�?
	AI_Output (self ,other,"DIA_Moe_Harbor_Militia_01_01"); //Ils n'osent pas venir ici, alors, on se charge de faire r�gner l'ordre nous-m�mes.
};

FUNC VOID DIA_Moe_Harbor_Rumors ()
{
	AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_00"); //Quelles sont les rumeurs qui circulent�?
	
	if (Kapitel == 1)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_01"); //Par ici, on n'aime pas trop les gens qui posent des questions... surtout quand il s'agit d'�trangers.
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_02"); //Il n'y en a pas. Que voudriez-vous qui se dise�? Tout est calme ici.
		}
		else if (hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_03"); //(faussement anxieux) Tout va mal. Les temps sont durs et tout le monde fait de son mieux pour subsister.
			AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_04"); //Arr�tez de vous moquer de moi�!
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_05"); //Qui, moi�? Comment pouvez-vous penser une telle chose�? Vous me blessez�!
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_06"); //La situation est explosive, car cela fait un petit moment que le seigneur Andr� s'�vertue � mettre son nez un peu partout... et surtout l� o� il n'a pas � �tre.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_07"); //Mais la milice ne comprendra jamais la mani�re dont tout fonctionne ici.
		};
		
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_08"); //Nous n'avons rien � voir avec cette affaire.
				AI_Output (other,self ,"DIA_Moe_Harbor_Rumors_15_09"); //Quelle affaire�?
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_10"); //Le meurtre du paladin. Au lieu de perdre votre temps ici, vous feriez mieux de vous int�resser aux mercenaires.
			}
			else
			{
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_11"); //Je sais bien que vous n'y �tes pour rien, mais le meurtre du paladin a vraiment fait peur aux gentilshommes, si vous voyez ce que je veux dire.
				AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_12"); //Conseil d'ami�: quittez la ville, du moins pour un temps.
			};	
		}
		else
		{
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_13"); //Depuis qu'on sait que ce ne sont pas les mercenaires qui ont tu� le paladin, les miliciens n'osent plus venir ici.
			AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_14"); //A mon avis, ils ont peur de prendre des coups. �a me va.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_15"); //Il n'y a absolument rien de neuf ici.
	}
	else //Kapitel 5
	{
		AI_Output (self ,other,"DIA_Moe_Harbor_Rumors_01_16"); //Ces paladins bouffis d'orgueil quittent enfin le port. Pas trop t�t�!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_432_Moe;
	nr			 =  2;
	condition	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information	 = 	DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Moe_LEHMARGELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //H�, vous�! Vous avez le bonjour de Lehmar.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};







