//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Que faites-vous ici ?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Qu'est-ce que vous faites ici ?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Vous cherchez quelque chose ?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Des plantes - je cherche des plantes ?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//G�n�ralement, je recherche des plantes.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//La plupart des plantes qui poussent ici sont utiles d'une mani�re ou d'une autre.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//De nombreuses plantes poss�dent des propri�t�s m�dicinales. Quant � l'herbe des marais, vous pouvez m�me la fumer.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Avant de purger ma peine derri�re la Barri�re, j'�tais un alchimiste.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Pourquoi vous ont-ils enferm� derri�re la Barri�re ?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Mais pourquoi vous ont-ils enferm� derri�re la Barri�re ?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Je m'int�ressais de pr�s aux potions d'alt�ration mentale.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Un soir, mon ma�tre Ignaz a bu l'une de mes 'exp�riences', croyant qu'il s'agissait de 'vin'.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//�a l'a provisoirement rendu... quelque peu impr�visible, et depuis, il n'a plus vraiment toute sa t�te.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(avec m�pris) Les mages m'ont jet� derri�re la Barri�re pour cette simple raison. Leur chef d'accusation �tait 'L'Etude de connaissances interdites'.
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Que pouvez-vous me dire sur le camp ?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Que pouvez-vous me dire sur le camp ?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Pas grand-chose. Je ne m'y suis jamais rendu.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Seuls les gens de Raven y sont depuis le tout d�but. Tous les autres qui, comme moi, sont arriv�s par la suite doivent attendre qu'ils aient besoin de nouvelles personnes.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Comment �tes-vous arriv� ici ?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Comment �tes-vous arriv� ici ?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Eh bien, de la m�me mani�re que vous, j'imagine. Avec les pirates, par la mer.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //La vall�e ici est compl�tement isol�e. Il n'y a aucun moyen d'y acc�der par voie terrestre.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(pensif) Bien.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Quand ont-ils besoin de nouvelles personnes ?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //Quand ont-ils besoin de nouvelles personnes ?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //Eh bien, quand certaines personnes du camp viennent � dispara�tre...
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Si un mineur se fait d�vorer par un foreur dans la mine, ils laissent l'un de nous le remplacer.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //Parfois, il arrive aussi que les hommes de Raven s'entretuent. Mais ces derniers temps, leur comportement s'est am�lior� sur ce point.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Raven est parvenu � contr�ler les acc�s � la mine - ainsi, seules quelques personnes peuvent y rentrer en m�me temps.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Mais je ne sais pas vraiment comment �a fonctionne... je n'y suis jamais rentr�.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "A propos de Fortuno...";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno semble �tre quelque peu frapp� d'amn�sie, et aurait besoin d'une potion pour retrouver la m�moire.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno ? C'est le serviteur de Raven, non ?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//�a l'�tait. Maintenant, il n'est que l'ombre de lui-m�me. Et c'est l'�uvre de Raven.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Raven ? Jusque r�cemment, je le tenais en estime... Hm, admettons. Mais ici, dans ce marais, je ne peux brasser aucune potion.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Je pourrais brasser cette potion. Il y a un laboratoire d'alchimie � l'int�rieur du camp. Il me faut simplement la recette.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Utilisez cette recette avec prudence. Le brassage de cette potion est une science d�licate � ma�triser.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Si quelque chose d'impr�vu se produit lors du brassage ou si l'un des ingr�dients n'est pas le bon, la potion sera mortelle.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Je ferai attention.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel m'a fourni la recette d'une potion. Je peux l'utiliser pour aider Fortuno � se rappeler. Je ne pourrai brasser cette potion que lorsque je me serai familiaris� avec tous les ingr�dients. Dans le cas contraire, elle sera mortelle.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Pouvez-vous m'enseigner quelque chose ?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Pouvez-vous m'enseigner quelque chose ?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Je n'en ai pas le temps. Je suis ici pour gagner de l'or. Et aussi longtemps que je ne pourrai pas rentrer dans le camp, je gagnerai ma vie en vendant des herbes.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Mais si vous avez besoin de quelques potions, il m'en reste encore.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Je peux acheter des potions et des plantes aupr�s de Miguel.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



