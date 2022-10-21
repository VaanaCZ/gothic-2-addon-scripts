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

	AI_Output			(self, other, "DIA_Dragon_Ice_Exit_20_00"); //S�la Oka vyhasla a tv�j �as vypr�el.

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
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_00"); //Pro� ru�� m�j odpo�inek? To se mus�m v��n� zahrab�vat na st�le vzd�len�j��ch m�stech jen proto, aby m� takov� protivn� hav� jako ty nechala na pokoji?
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_01"); //Mluv�c� drak. Po�ehn�no bu� Innosovo oko.
	};
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_02"); //Vy lid� jste podivn� stvo�en�. I kdy� v�s smete ledov� vichr smrti, v�dycky se najde n�kdo, kdo povstane z popela a mysl� si o sob�, �e je mu d�no b�t hrdinou.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_03"); //Ale to brzo skon��. Osobn� dohl�dnu na to, aby nikdo z v�s u� nikdy z ni�eho nepovstal.
	AI_Output			(other, self, "DIA_Dragon_Ice_Hello_15_04"); //Ticho. S moc� posv�tn�ho Oka, je� mi byla prop�j�ena, si m��u dovolit zeptat se t� na p�r v�c�.
	AI_Output			(self, other, "DIA_Dragon_Ice_Hello_20_05"); //Ha, ha, ha. Jen se ptej. Tv� v�domosti ti nebudou k ni�emu.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_WERBISTDU		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Ice_WERBISTDU_Condition;
	information	 = 	DIA_Dragon_Ice_WERBISTDU_Info;

	description	 = 	"Kdo jsi?";
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
	AI_Output			(other, self, "DIA_Dragon_Ice_WERBISTDU_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Ice_WERBISTDU_20_01"); //Jsem Finkregh. P�n ledu a sn�hu, str�ce shrom�d�n� a konec konc� i tv� smrt.

};

///////////////////////////////////////////////////////////////////////
//	Info Beliar
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_BELIAR		(C_INFO)
{
	nr		 = 	6;
	condition	 = 	DIA_Dragon_Ice_BELIAR_Condition;
	information	 = 	DIA_Dragon_Ice_BELIAR_Info;

	description	 = 	"Jak�mu bohu slou��?";
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
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_00"); //Jak�mu bohu slou��?
	AI_Output			(other, self, "DIA_Dragon_Ice_BELIAR_15_01"); //Jak� zpropaden� b�h mohl kdy dovolit takov� ohavn� potvo�e jako ty chodit po t�hle zemi?
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_02"); //Neobt�uj se porozum�t smyslu na�eho shrom�d�n�, mal� hrdino.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_03"); //Beliar n�m nejen dovolil, abychom tu byli - on n�s dokonce vede.
	AI_Output			(self, other, "DIA_Dragon_Ice_BELIAR_20_04"); //Podn�ceni jeho svat�mi slovy si neodpo�ineme do t� doby, ne� se jeho v�le prom�n� v skutky.

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






