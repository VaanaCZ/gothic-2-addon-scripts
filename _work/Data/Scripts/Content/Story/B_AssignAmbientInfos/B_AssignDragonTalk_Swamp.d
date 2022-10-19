// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Swamp_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Swamp_Exit_Condition;
	information	= DIA_Dragon_Swamp_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Swamp_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Swamp_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Swamp_Exit_20_00"); //Wyczerpa�a si� moc Oka. Nadszed� tw�j kres, cz�owieku.

	Swampdragon = Hlp_GetNpc (dragon_swamp);

	Swampdragon.flags = 0;

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;

	if (DJG_SwampParty_GoGoGo == TRUE)
	{
		if (DJG_SwampParty == TRUE) 
		&& (Npc_IsDead(DJG_Cipher) == FALSE)
		{
			B_StartOtherRoutine	(DJG_Rod,"SwampDragon");
		};
		B_StartOtherRoutine	(DJG_Cipher,"SwampDragon");
	};

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Swamp_Hello(C_INFO)
{
	nr			= 5;
	condition	= DIA_Dragon_Swamp_Hello_Condition;
	information	= DIA_Dragon_Swamp_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Swamp_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Swamp_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_00"); //Biada ci, je�li zbli�ysz si� jeszcze o krok!

	if (Mis_KilledDragons == 0)
		{
			AI_Output	(other, self, "DIA_Dragon_Swamp_Hello_15_01"); //Ha. Oko Innosa najwyra�niej dzia�a.
		};
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_02"); //By�o tu przed tob� wielu takich jak ty. �aden si� nie osta�.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_03"); //Oszcz�dzaj oddech. Twoje s�owa mnie nie przestrasz�, piekielny gadzie.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_04"); //Odpowiesz na moje pytania albo utopi� ci� w twojej w�asnej krwi.
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_05"); //Ha, ha, ha. �miesz mi grozi�, robaczku? Podaj cho� jeden pow�d, dla kt�rego nie mia�bym ci� od razu rozerwa� na tysi�c strz�p�w.
	AI_Output			(other, self, "DIA_Dragon_Swamp_Hello_15_06"); //Jestem wys�annikiem Innosa. Mam przy sobie �wi�te Oko. Nie masz wyboru. R�b, co ci ka��, albo spotka ci� zas�u�ona kara.
	AI_Output			(self, other, "DIA_Dragon_Swamp_Hello_20_07"); //Aargh. M�w! Czego ode mnie chcesz?
};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WERBISTDU		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Swamp_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Swamp_WERBISTDU_Info;

	description	 = 	"Kim jeste�?";
};

func int DIA_Dragon_Swamp_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Swamp_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Swamp_WERBISTDU_15_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_Dragon_Swamp_WERBISTDU_20_01"); //Nazywam si� Pandrodor. Dobrze ci radz�: uciekaj st�d, p�ki jeszcze mo�esz!
	
};


///////////////////////////////////////////////////////////////////////
//	Info WoSindDieAnderen
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WOSINDDIEANDEREN		(C_INFO)
{
	nr		 = 	7;
	condition	 = 	DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information	 = 	DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;

	description	 = 	"Gdzie znajd� reszt� twoich ohydnych pobratymc�w?";
};

func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00"); //Gdzie znajd� reszt� twoich ohydnych pobratymc�w?
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01"); //�ywio�y, od kt�rych wszystko pochodzi, utrzymuj� ten �wiat w harmonii.
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02"); //Ka�dy z nich sprawuje w�adz� nad jedn� cz�ci� �wiata.
	AI_Output			(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03"); //Szukaj �ywio��w, a znajdziesz moich braci.
};



//**********************************************************************************
//		B_AssignDragonTalk_Swamp
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Swamp (var c_NPC slf)
{
	DIA_Dragon_Swamp_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc	= Hlp_GetInstanceID(slf);

	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
};








