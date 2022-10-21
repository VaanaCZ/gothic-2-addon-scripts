// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Ice_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Ice_Exit_Condition;
	information	= DIA_Dragon_Ice_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Ice_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Ice_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Ice_Exit_20_00"); //W�adza Oka nade mn� dobieg�a ko�ca. Tw�j czas na tym �wiecie r�wnie�.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};	
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_29_02");
	
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_ICEREGION_30_01");

	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc		(Draconian,"FP_ROAM_OW_BLOODFLY_05_01");

};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Ice_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Ice_Hello_Condition;
	information	= DIA_Dragon_Ice_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Ice_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Ice_Hello_Info()
{
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_00"); //Dlaczego zak��casz m�j odpoczynek? Czy mam si� zakopa� jeszcze g��biej, by�cie mnie wreszcie zostawili w spokoju?
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_01"); //Gadaj�cy smok. Chwa�a niech b�dzie Oku Innosa.
	};
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_02"); //Zaprawd�, jeste�cie niezwyk�ymi istotami. Niewa�ne, ile razy przetoczy si� przez was lodowaty wicher �mierci, zawsze znajdzie si� jeden, kt�ry powstanie z popio��w, my�l�c, �e s�dzone mu by� bohaterem.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_03"); //Ale to si� wkr�tce zmieni. Osobi�cie dopilnuj�, by tym razem �aden z was nie powsta�.
	AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_04"); //Milcz! Na moc �wi�tego Oka, kt�re powierzono w moje r�ce, zaklinam ci�: odpowiedz na moje pytania!
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_05"); //Ha, ha, ha. Pytaj wi�c. Twoja wiedza i tak na nic ci si� nie zda.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_WERBISTDU		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Ice_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Ice_WERBISTDU_Info;

	description	 = 	"Kim jeste�?";
};

func int DIA_Dragon_Ice_WERBISTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Ice_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Ice_WERBISTDU_15_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_Dragon_Ice_WERBISTDU_20_01"); //Jestem Finkregh, pan lodu i �niegu, Stra�nik Spotkania, i ten, kt�ry zako�czy tw�j n�dzny �ywot.

};

///////////////////////////////////////////////////////////////////////
//	Info Beliar
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_BELIAR		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Ice_BELIAR_Condition;
	information	 = 	DIA_Dragon_Ice_BELIAR_Info;

	description	 = 	"Kt�remu bogu s�u�ysz?";
};

func int DIA_Dragon_Ice_BELIAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Ice_BELIAR_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_00"); //Kt�remu bogu s�u�ysz?
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_01"); //Jakie� to przekl�te b�stwo pozwala, by tak odra�aj�ce istoty jak ty chodzi�y po naszym �wiecie?
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_02"); //Pr�no si� trudzisz, pr�buj�c ogarn�� znaczenie naszego spotkania, ma�y bohaterze.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_03"); //Beliar nie tylko pozwoli� na nasze przybycie. On KAZA� nam tutaj przyby�!
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_04"); //Ws�uchani w jego �wi�te s�owa, nie spoczniemy, p�ki nie spe�ni si� jego wola.

};

//**********************************************************************************
//		B_AssignDragonTalk_Ice
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Ice (var c_NPC slf)
{
	DIA_Dragon_Ice_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc		= Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_BELIAR.npc			= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};






