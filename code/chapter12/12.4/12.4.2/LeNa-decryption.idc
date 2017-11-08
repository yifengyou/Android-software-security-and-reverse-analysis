/* LeNa-Decryption.idc

   Simple decryption script for the LeNa.b/.c variants.

   Designed for use on the elf binary that LeNa drops, it works by decrypting the
   encrypted string and dropping the decrypted bytes as a comment where ever the
   string's pointer is used.

   The decryption is really easy (a MVNS), basically a xor to 0xFF

   Timothy Strazzere <Tim.Strazzere@mylookout.com>
   March 2012
*/

#include <idc.idc>

static decrypt_string(void)
{
    auto original_address, ptr, comment;

    // This is normally a pointer to a pointer, follow it
    original_address = ptr = Dword(ScreenEA());

    // Make sure we retrieved a good address
    if (ptr == BADADDR) {
       Message("Unable to find a actual encrypted string's address!\n");
       return;
    }

    // XOR until we hit the null byte of the string
    comment = "";
    while(Byte(ptr) != 0x00) {
        comment = comment + sprintf("%s", Byte(ptr) ^ 0xFF);
	ptr++;
    }

    // Drop a comment at the address we originally where pointing too
    MakeRptCmt(original_address, "Decrypted value:  " + comment);

    // Drop a comment on all xrefs to this
    auto xref = Dfirst(original_address);
    while(xref != BADADDR) {
        MakeRptCmt(xref, "Decrypted value: " + comment);
	xref = Dnext(original_address, xref);
    }

    // Drop a message in the output window
    Message("Decrypted string: %s\n", comment);
}

static main(void) {
    // Set hotkey for decryption routine
    if(AddHotkey('/', "decrypt_string") != IDCHK_OK) {
        Message("Something went wrong with adding a hotkey for the decryption routine");
    }
    Message("Hotkey added!\n");
}