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
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Qui êtes-vous ? On se connaît ?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Si vous le dites. Je vais voir le propriétaire terrien." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "Qui veut le savoir ?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //Et vous, qui êtes-vous ?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Buster. Je suis l'un des mercenaires de Lee.
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //Et vous avez intérêt à me parler plus gentiment si vous ne voulez pas que je vous tanne le cuir !
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Bon, qu'est-ce que vous voulez ?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Cela ne vous regarde pas."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Je connais Lee !"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Je suis juste un voyageur en route pour rencontrer le propriétaire." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Je connais Lee.
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Tout le monde connaît Lee ! Ça, ça veut rien dire, mon pote ! Et en ce moment c'est à moi que vous parlez, pas à lui !
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Alors, vous allez où ?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Cela ne vous regarde pas."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Je suis juste un voyageur en route pour rencontrer le propriétaire." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Cela ne vous concerne pas.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Personne n'a le droit de me parler de cette manière misérable larve ! Il est grand temps que quelqu'un vous botte le cul !
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Si vous le dites. Je vais voir le propriétaire terrien.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //Vraiment ? Hmm... vous ne m'avez guère l'air dangereux.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Vous voulez le savoir ?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "A l'occasion, j'ai tué une bête ou deux."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "C'est votre droit." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //Ça, vous avez bien raison !
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //(fier de lui) C'est le genre de chose qu'on voit tout de suite avec l'expérience, mon pote.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //La plupart du temps, on se bat contre les orques... ou les gardes de la ville. Persévérants, ceux-là... (éclate de rire)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Voulez-vous parler de VERITABLES orques ? Ces gros trucs ?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Et ?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Impressionnant." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Il m'est arrivé de tuer quelques créatures.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //(éclate de rire) Des rats ou d'autres bestioles nuisibles qui s'en prennent aux plantations j'imagine.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Mais ici, c'est aux orques qu'on a affaire. Et à ces minables gardes de la ville, bien sûr. (éclate d'un rire narquois)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Voulez-vous parler de VERITABLES orques ? Ces gros trucs ?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Et ?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Impressionnant." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Vous voulez voir par vous-même ?
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Oh, mon Dieu ! Je n'aurais pas dû vous chercher, c'est ça ?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //On peut le dire en effet.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //Alors, montrez-moi ce que vous valez.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Impressionnant.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //(éclate de rire) C'est notre boulot, petit ! Et on fabrique nous-mêmes nos armes et armures.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //On défie la mort chaque jour, mais un paysan tel que vous ne peut pas s'en rendre compte, bien sûr.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Il va falloir que je vous montre ce que je sais dans ce domaine !"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Puisque vous le dites."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Si vous le dites.
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //(grogne d'irritation) Tirez-vous, minable !

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //On dirait qu'il va falloir que je vous montre ce que je sais sur le sujet...
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //Vous cherchez à nous jouer la révolte des paysans à vous tout seul, c'est ça ?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Très bien, montrez-moi ce que vous savez faire.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Alors ?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //(grogne de mépris) Comme si vous saviez de quoi vous parler. Vous vous prenez pour un caïd, pas vrai ?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //(en colère) Je crois qu'il est grand temps que quelqu'un vous donne une bonne leçon !
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Quand vous voulez !"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Je plaisantais..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //De vrais orques, vous voulez dire ? Ils sont pas trop grands pour vous ?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //(soupire) Je veux parler de... hé, une petite minute ! Vous vous fichez de moi ou quoi ?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //(sourit) Loin de moi cette idée.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Espèce de larve ! (agressif) Vous me cherchez, hein ?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //Alors, montrez-moi de quoi vous êtes capable, le héros !
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Quand vous voulez !"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Je plaisantais..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //Quand vous voulez !
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //Alors, venez-y, mon pote !
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //C'était pour rire.
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //C'est ça, débinez-vous ! Tirez-vous, je veux plus vous voir !
	
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
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Qu'est-ce que vous me voulez, minable ?
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
	description = "Je vous défie en duel !";
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
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Je vous défie en duel !
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ha, ha, ha ! Vous n'êtes pas du genre à vous laisser marcher sur les pieds, hein ? Très bien, venez ici.
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Vous voulez réessayer ? Mais c'est que vous seriez enquiquinant, à la longue ! Très bien, venez-y !
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //Mais cette fois-ci, défense de partir en courant !
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
	description = "Je veux me joindre aux mercenaires !";
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
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Je voudrais rejoindre les mercenaires.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Un type capable de cogner aussi fort que vous ne devrait pas éprouver de difficultés dans le coin.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //J'ai connu de meilleurs combattants, mais vous au moins, vous n'êtes pas un lâche.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Mon avis ne vaut pas lourd car je ne suis pas là depuis longtemps, mais si Lee me le demande, je voterai pour vous.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Depuis que j'ai vaincu Buster, il n'est pas contre le fait que je me joigne aux mercenaires.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Vous ? Je ne crois pas qu'on ait jamais laissé un lâche se joindre aux mercenaires.
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Le fait de vous enfuir au beau milieu d'un duel ne vous permettra pas d'aller bien loin par ici.
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
	description = "Je veux en savoir plus au sujet des mercenaires et de cette région.";
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
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Je voudrais en savoir davantage sur les mercenaires et la région en général.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //Je ne peux pas vous dire grand-chose sur la région. Pour ça, allez voir les fermiers.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //Pour ce qui est des mercenaires, notre mode de fonctionnement est simple : tous ceux qui sont capables de défendre leur bout de gras sont acceptés.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Je pense que vous avez l'étoffe pour être des nôtres.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Mais ne prenez surtout pas la grosse tête. N'oubliez pas que vous avez eu beaucoup de chance quand nous nous sommes battus.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Et puis il y a plein de types qui sont plus forts que moi ici.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Sentenza, pour commencer. C'est lui qui garde l'entrée de la ferme. Je vous déconseille vivement de lui chercher des noises.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Mais qu'est-ce que je raconte moi ? Pourquoi je dis tout ça à une mauviette ?
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
	description = "Et à propos de ce Sentenza ?";
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
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //Parlez-moi de ce Sentenza.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Il essayera de vous obliger à le payer quand vous arriverez à la ferme. Il fait le coup à tous les nouveaux venus.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //A votre place, je paierais. C'est ce que j'ai fait personnellement. Et après, il a voté pour moi.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Un prêté pour un rendu comme il dit. Evidemment, ça m'a coûté tout ce que je possédais, mais ce n'était pas lourd. Et, au final, je n'ai pas eu à le regretter.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Surtout qu'un jour, je l'ai vu tabasser un pauvre mec qui s'était mis en tête de ne pas le payer.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Merci du conseil.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //De rien. Encore que ça vaut sans doute un petit quelque chose, non ?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Non.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Tenez, 5 pièces d'or.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Tenez, voici 5 pièces d'or.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Merci, mon vieux. On dirait que je vais pouvoir boire un coup ce soir, finalement. Je ne l'oublierai pas.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Non.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //C'est bien ce que je pensais.
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
	description = "Lee est le chef des mercenaires, n'est-ce pas ?";
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
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee est le chef des mercenaires, pas vrai ?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Oui. Hé, ça y est, je me souviens d'où je vous connais ! Vous étiez à la colonie minière vous aussi !
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //(soupire) C'est exact.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Je ne vous ai pas vu quand tout a sauté. Ni peu de temps avant d'ailleurs.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //J'avais d'autres soucis à l'époque.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Dans ce cas, vous avez raté des tas de trucs. Les choses ont bien changé depuis qu'on était en taule ensemble.
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
	description = "Qu'est-il arrivé aux mercenaires de la colonie ?";
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
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Qu'est-il advenu des mercenaires de la colonie ?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Une fois la Barrière disparue, Lee nous a fait sortir de là en nous disant que rien ne nous arriverait si on on restait ensemble. Et il avait raison.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Il ne nous a pas fallu longtemps pour trouver un coin sympa ici. Le propriétaire terrien local nous paye pour tabasser les miliciens.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //Et le plus beau, c'est que la plupart d'entre nous seraient d'accord pour le faire gratuitement !
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Mais Onar nous nourrit, ce qui nous permet d'attendre le moment où on pourra enfin se tirer de cette maudite île.
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
	description = "Pouvez-vous m'apprendre à mieux me battre ?";
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
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Pouvez-vous m'apprendre à mieux combattre ?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Je pourrais peut-être vous donner un ou deux conseils...
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Vous n'êtes pas aussi stupide que vous en avez l'air. D'accord, je vais vous apprendre ce que je sais. Comme ça vous aurez peut-être une chance contre moi la prochaine fois...
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster peut m'enseigner le combat avec des armes à une main.");
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
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hé, mon pote !
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Que voulez-vous ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Ça fait quelques jours que je réfléchis au moyen de se faire du fric dans ce trou.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //Et ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Je crois avoir trouvé le moyen de s'enrichir rapidement.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Un marchand de la ville est prêt à cracher une belle somme en échange d'un certain objet...

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Qui est ce marchand dont vous parlez ?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Qu'est-ce que cela signifie ?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Pourquoi me dire ça ?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Pourquoi me dites-vous ça ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Parce que je ne peux pas m'en charger moi-même. Je suis obligé de rester là pour garder ces moutons débiles.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Vous voulez dire les fermiers ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //Oui, c'est bien ce que j'ai dit.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //De quoi s'agit-il ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Le marchand pense pouvoir réaliser un joli profit en vendant des cornes de bête des ombres.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Evidemment, il faut pour ça que quelqu'un aille lui en chercher dans les bois. Et c'est là que vous entrez en jeu.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Combien peut-on gagner avec ça ?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Combien ça me rapportera ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Un sacré paquet, je peux vous le dire. Il y en aura bien assez pour nous deux.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //Et comme vous m'avez donné de l'or par le passé, je vous fais un prix.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //Ça me paraît bien. Je vous préviendrai quand j'aurai des cornes.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster me donnera un bon prix pour chaque corne de bête des ombres que je lui rapporterai."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Qui est ce marchand dont vous me parlez ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Oh que non, mon pote. Il faudrait vraiment que je sois stupide pour vous révéler son nom. Vous essayeriez pas de me doubler des fois ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Soit vous faites affaire avec moi, soit vous êtes hors du coup, pigé ?

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

	description	 = 	"Au sujet des cornes de bête des ombres...";
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
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Le marchand a dit au revoir à tout le monde.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Qu'est-ce que ça signifie ?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Qu'il est mort. Vous pouvez garder les cornes, je ne saurais plus quoi en faire maintenant.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Comment on découpe la corne d'une bête des ombres ?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Vous le savez pas ? Bon sang, je vous aurais cru plus dégourdi !
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Je reviendrai vous voir pour ça.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("Apprenez-moi.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
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
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //J'ai une corne de bête des ombres.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //J'ai d'autres cornes de bêtes des ombres pour votre marchand.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Génial ! Donnez-moi ça et allez vite en chercher d'autres. Qui sait combien de temps encore le marchand sera intéressé ?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Voici votre part.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //Apprenez-moi.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //Bon, ouvrez grand vos oreilles. Une fois que vous avez tué la bête des ombres, vous attrapez sa corne et vous la serrez bien fort.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Et puis, vous plantez votre couteau dans son front et vous découpez tout autour de la corne.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Après ça, il ne vous reste plus qu'à faire levier avec la lame de votre couteau pour extraire la corne.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //Et à me la ramener, bien sûr. Ça, ça ne devrait pas être trop dur.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Je vais revenir vous voir à ce sujet.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //J'espère bien.
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
	description = "Que pensez-vous de cette histoire de chasseurs de dragons ?";
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
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Que pensez-vous des chasseurs de dragons ?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Ces types pourraient revenir pleins aux as... à moins qu'ils ne finissent par bouffer les pissenlits par la racine.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Personnellement, je préfère rester avec Lee.
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








































