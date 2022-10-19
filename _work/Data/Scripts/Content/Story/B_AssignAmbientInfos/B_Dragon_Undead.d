// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //I jak, kole�? Masz te� orygina�?
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Exit(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 999;
	condition	= DIA_Dragon_Undead_Exit_Condition;
	information	= DIA_Dragon_Undead_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Undead_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Hello(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 5;
	condition	= DIA_Dragon_Undead_Hello_Condition;
	information	= DIA_Dragon_Undead_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Undead_Hello_Info()
{	
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //A wi�c uda�o ci si� mnie odnale��. Bardzo d�ugo czeka�em na twoje przybycie.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Nie roz�mieszaj mnie. Zaraz mi powiesz, �e wszystko przebiega zgodnie z twoim planem.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //C� ty mo�esz wiedzie� o moich zamiarach?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Czy� nie wys�a�em Poszukiwaczy, by naprowadzili ci� na m�j �lad?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Czy nie pozostawi�em �lad�w mojego istnienia, tak wyra�nych, �e trudno je by�o przeoczy�?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //Czy nie dosta�e� si� tutaj dzi�ki zbroi wykonanej ze smoczych jaj?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //Czy nawr�ceni paladyni nie byli wystarczaj�cym powodem, by� poszuka� sprawcy ca�ego tego zamieszania?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Czy spotkanie z op�tanymi nieszcz�nikami nie by�o wystarczaj�cym powodem, by� poszuka� sprawcy ca�ego tego zamieszania?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Cho�by� nie wiem jak pr�bowa�, nie mo�esz temu zaprzeczy�.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Przeznaczenie tylko jednej sztuki nie zosta�o z g�ry okre�lone! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Zabi�e� jednego z moich s�ug. To on mia� pos�ugiwa� si� Szponem...
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //S�dz�, �e ty go teraz masz. I za to zginiesz!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Do�� tego.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kto wys�a� ci� na t� wojn� przeciw rodzajowi ludzkiemu?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Dlaczego tu przyby�e�?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Kim jeste�?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Przeciwnikiem jest smok-o�ywieniec. Musz� go zabi�, zanim b�d� m�g� opu�ci� t� przekl�t� wysp�."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //Nadal musisz o to pyta�? Zastan�w si�, g�upcze. Przecie� wiesz, kim jestem.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Nie mam imienia. Tak jak ty nie masz imienia.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //M�j stw�rca obdarzy� mnie bosk� moc�, tak jak tw�j b�g obdarzy� moc� ciebie.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Moim przeznaczeniem jest zniszczy� �wiat.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Tak, jak twoje przeznaczenie wyznacza moralny kod paladyn�w.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Tak, jak ty sam niesiesz �mier�, �owco smok�w.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Tak, jak twoim celem jest g�oszenie wiary Innosa, Magu Ognia.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Czy nie czujesz wi�zi, kt�ra nas ��czy? Tak! Ju� wiesz, kim jestem.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //Nie... To niemo�liwe! Xardas zawsze m�wi�...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas jest s�aby. Nie stanowi dla mnie �adnego zagro�enia. Tylko ty jeste� godzien stawi� mi czo�a.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //Tak zosta�o zapisane. Pora, by� pogodzi� si� ze swoim przeznaczeniem.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Dlaczego tu przyby�e�?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //Powierzono mi m� moc, bym dzi�ki niej sk�pa� ten �wiat w morzu krwi.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Nie spoczn�, p�ki ostatnia forteca praworz�dno�ci nie obr�ci si� w py�.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Kto wys�a� ci� na t� wojn� przeciw rodzajowi ludzkiemu?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Moim w�adc� jest Pan Ciemno�ci. Znasz go. S�yszysz jego zew.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Moje armie powstan� wkr�tce z jego imieniem na ustach, a �wiat spowije wieczny mrok.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Do�� tego. Wy�l� ci� z powrotem do piek�a, z kt�rego wype�z�e�, gadzie.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //Nie jeste� jeszcze got�w do walki ze mn�. Jeszcze chwila, a m�j cel zostanie osi�gni�ty.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Naprawd� s�dzisz, �e mo�esz mi zaszkodzi� tym szponem?
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Twoje szcz�tki pozwol� mi wyzwoli� wiatr �mierci, kt�ry wkr�tce omiecie ca�y �wiat.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





