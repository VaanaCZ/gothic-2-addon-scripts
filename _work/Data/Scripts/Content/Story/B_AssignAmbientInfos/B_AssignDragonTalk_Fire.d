// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Fire_Exit_Condition;
	information	= DIA_Dragon_Fire_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //Oko ztratilo svou moc a ty se nedo�k� p��t�ho dne.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;


	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};	
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Fire_Hello_Condition;
	information	= DIA_Dragon_Fire_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Fire_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Prost� nem��u uv��it, �e opravdu je�t� existuj� lid�, kte�� jsou ochotni ob�tovat sv�j �ivot jen proto, aby na vlastn� o�i vid�li draka.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Jsi docela v��e�n� - na takovou neskladnou obludu.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Nep�i�el jsem se obdivovat tv�mu zevn�j�ku. M�m pon�kud radik�ln�j�� �mysly, je mi l�to.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Nechce� t�m ��ct, �e se mi hodl� postavit?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ha, ha, ha. Zlom�m ti ten tv�j huben� kr�ek.
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Ne tak rychle, p��teli. M�m u sebe Innosovo oko. Nem��e� odolat m� moci. Odpov�z na m� ot�zky, nebo okus� nesnesiteln� muka.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //(�ve) Arrgh. Tak se pochlub t�mi tv�mi ot�zkami, dokud m��e�. Tv� moc nebude m�t dlouh�ho trv�n�.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Dragon_Fire_WerBistDu_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_WerBistDu_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Jmenuju se Feomathar, a to je v�e, co se o mn� dozv�.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Jakmile uniknu ��ink�m kouzla Oka, u�ije� si ��ru po��dn�ho plamene.

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Tak kde m� ty sv� poklady?";
};

func int DIA_Dragon_Fire_HORT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_HORT_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Ka�d� drak m� skr��, ve kter� schov�v� sv� poklady. Tak�e, kde ta skr�� je?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //Na m�st�, o kter�m si bude� moci nechat jen zd�t, jakmile se zbav�m �et�z� toho Oka.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Vzal jsem sv�j poklad nahoru na �hav� �tesy, kter� lze nazvat v�elijak, jenom ne p��stupn�mi neok��dlen�mu �lov��kovi, jako jsi ty.

};


//**********************************************************************************
//		B_AssignDragonTalk_Fire
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Fire (var c_NPC slf)
{
	DIA_Dragon_Fire_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};




